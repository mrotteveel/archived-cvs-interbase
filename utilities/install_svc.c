/*
 *	PROGRAM:	Windows NT service control panel installation program
 *	MODULE:		install_svc.c
 *	DESCRIPTION:	Service control panel installation program
 *
 * The contents of this file are subject to the Interbase Public
 * License Version 1.0 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy
 * of the License at http://www.Inprise.com/IPL.html
 *
 * Software distributed under the License is distributed on an
 * "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express
 * or implied. See the License for the specific language governing
 * rights and limitations under the License.
 *
 * The Original Code was created by Inprise Corporation
 * and its predecessors. Portions created by Inprise Corporation are
 * Copyright (C) Inprise Corporation.
 *
 * All Rights Reserved.
 * Contributor(s): ______________________________________.
 */

#include "../jrd/ib_stdio.h"
#include <stdlib.h>
#include <windows.h>
#include "../jrd/common.h"
#include "../jrd/license.h"
#include "../utilities/install_nt.h"
#include "../utilities/servi_proto.h"
#include "../utilities/registry.h"
#include "../iscguard/iscguard_utils.c"

extern USHORT	svc_error (SLONG, TEXT *, SC_HANDLE);
static void	usage (void);
static USHORT using_guardian (USHORT (*err_handler)());
static USHORT guardian_setup (USHORT (*err_handler)());

static struct {
    TEXT	*name;
    USHORT	abbrev;
    USHORT	code;
} commands [] = {
    "CONFIGURE", 1,	COMMAND_CONFIG,
    "INSTALL",	1,	COMMAND_INSTALL,
    "REMOVE",	1,	COMMAND_REMOVE,
    "START",	3,	COMMAND_START,
    "STOP",	3,	COMMAND_STOP,
    NULL,	0,	0
};

int CLIB_ROUTINE main (
    int		argc,
    char	**argv)
{
/**************************************
 *
 *	m a i n
 *
 **************************************
 *
 * Functional description
 *	Install or remove an InterBase service.
 *
 **************************************/
TEXT		**end, *p, *q, *cmd, *directory;
USHORT		sw_command, sw_version, sw_startup, sw_mode, sw_guardian;
USHORT		i, status;
SC_HANDLE	manager;

directory = NULL;
sw_command = COMMAND_NONE;
sw_version = FALSE;
sw_startup = STARTUP_DEMAND;
sw_mode = DEFAULT_CLIENT;
sw_guardian = NO_GUARDIAN;

end = argv + argc;
while (++argv < end)
    if (**argv != '-')
	{
	for (i = 0; cmd = commands [i].name; i++)
	    {
	    for (p = *argv, q = cmd; *p && UPPER (*p) == *q; p++, q++)
		;
	    if (!*p && commands [i].abbrev <= (USHORT) (q - cmd))
		break;
	    }
	if (!cmd)
	    {
	    ib_printf ("Unknown command \"%s\"\n", *argv);
	    usage();
	    }
	sw_command = commands [i].code;
	if (sw_command == COMMAND_INSTALL && ++argv < end)
	    directory = *argv;
	}
    else
	{
	p = *argv + 1;
	switch (UPPER (*p))
	    {
	    case 'A':
		sw_startup = STARTUP_AUTO;
		break;

	    case 'D':
		sw_startup = STARTUP_DEMAND;
		break;
		
/* Disable server sw_mode service options
   
	    case 'M':
		sw_mode = MULTI_CLIENT;
		break;

	    case 'S':
		sw_mode = SINGLE_CLIENT;
		break;
*/
	    case 'R':
		sw_mode = NORMAL_PRIORITY;
		break;

	    case 'B':
		sw_mode = HIGH_PRIORITY;
		break;

	    case 'Z':
		sw_version = TRUE;
		break;

	    case 'G':
		sw_guardian = USE_GUARDIAN;
		break;

	    default:
		ib_printf ("Unknown switch \"%s\"\n", p);
		usage();
	    }
	}

if (sw_version)
    ib_printf ("install_svc version %s\n", GDS_VERSION);

if (sw_command == COMMAND_NONE ||
    (!directory && sw_command == COMMAND_INSTALL) ||
    (directory && sw_command != COMMAND_INSTALL))
    usage();

manager = OpenSCManager (NULL, NULL, SC_MANAGER_ALL_ACCESS);
if (manager == NULL)
    {
    svc_error (GetLastError(), "OpenSCManager", NULL);
    exit (FINI_ERROR);
    }

switch (sw_command)
    {
    case COMMAND_CONFIG:
	status = SERVICES_config (manager, REMOTE_SERVICE, REMOTE_DISPLAY_NAME,
	    sw_mode, svc_error);
	if (status == SUCCESS)
	    ib_printf ("Service \"%s\" successfully configured.\n", REMOTE_DISPLAY_NAME);
	else
	    ib_printf ("Service \"%s\" not configured.\n", REMOTE_DISPLAY_NAME);
	break;

    case COMMAND_INSTALL:
	/* First, lets do the Guardian, if it has been specified. */
	if (sw_guardian) 
	{

		status = SERVICES_install (manager, ISCGUARD_SERVICE, ISCGUARD_DISPLAY_NAME,
			ISCGUARD_EXECUTABLE, directory, NULL, sw_startup, svc_error);
		if (status == SUCCESS)
			ib_printf ("Service \"%s\" successfully created.\n", ISCGUARD_DISPLAY_NAME);
		else if (status == IB_SERVICE_ALREADY_DEFINED)
			svc_error (GetLastError(), "CreateService", NULL);
		else
			ib_printf ("Service \"%s\" not created.\n", ISCGUARD_DISPLAY_NAME);

	/* Set sw_startup to manual in preparation for install the ib_server service*/
		sw_startup = STARTUP_DEMAND;

	/*	Finally, update the GuardianOptions to 1 so that Guardian 
		knows it is configured correctly. */	
		guardian_setup(svc_error);
	}

	/* do the install of IBServer */
	status = SERVICES_install (manager, REMOTE_SERVICE, REMOTE_DISPLAY_NAME,
	    REMOTE_EXECUTABLE, directory, NULL, sw_startup, svc_error);
	if (status == SUCCESS)
	    ib_printf ("Service \"%s\" successfully created.\n", REMOTE_DISPLAY_NAME);
	else if (status == IB_SERVICE_ALREADY_DEFINED)
	    svc_error (GetLastError(), "CreateService", NULL);
	else
	    ib_printf ("Service \"%s\" not created.\n", REMOTE_DISPLAY_NAME);
	
	break;

    case COMMAND_REMOVE:
	if (sw_guardian) 
	{
		status = SERVICES_remove (manager, ISCGUARD_SERVICE, ISCGUARD_DISPLAY_NAME, svc_error);

		if (status == SUCCESS)
		{
		    ib_printf ("Service \"%s\" successfully deleted.\n", ISCGUARD_DISPLAY_NAME);
		    status = SERVICES_delete (manager, ISCGUARD_SERVICE, ISCGUARD_DISPLAY_NAME, svc_error);
			if (status == SUCCESS)
				ib_printf ("Service configuration for \"%s\" successfully re-initialized.\n", ISCGUARD_DISPLAY_NAME);
			else
				ib_printf ("Service configuration for \"%s\" not re-initialized.\n", ISCGUARD_DISPLAY_NAME);
	    }
		else if (status == IB_SERVICE_RUNNING)
	    {
 			ib_printf ("Service \"%s\" not deleted.  You must stop it before\n", ISCGUARD_DISPLAY_NAME);
		    ib_printf ("attempting to delete it.\n");
	    }
		else	      
		    ib_printf ("Service \"%s\" not deleted.\n", ISCGUARD_DISPLAY_NAME);
	}

	status = SERVICES_remove (manager, REMOTE_SERVICE, REMOTE_DISPLAY_NAME, svc_error);
	
	if (status == SUCCESS)
	{
	    ib_printf ("Service \"%s\" successfully deleted.\n", REMOTE_DISPLAY_NAME);
	    status = SERVICES_delete (manager, REMOTE_SERVICE, REMOTE_DISPLAY_NAME, svc_error);
		if (status == SUCCESS)
			ib_printf ("Service configuration for \"%s\" successfully re-initialized.\n", REMOTE_DISPLAY_NAME);
		else
			ib_printf ("Service configuration for \"%s\" not re-initialized.\n", REMOTE_DISPLAY_NAME);
	}
	else if (status == IB_SERVICE_RUNNING)
		{
 		ib_printf ("Service \"%s\" not deleted.  You must stop it before\n", REMOTE_DISPLAY_NAME);
		ib_printf ("attempting to delete it.\n");
	    }
		else	      
		    ib_printf ("Service \"%s\" not deleted.\n", REMOTE_DISPLAY_NAME);
	
	break;

    case COMMAND_START:
	/* Test for use of Guardian. If so, start the guardian else start ib-server */
	if (using_guardian (svc_error)==1)
	{
		status = SERVICES_start (manager, ISCGUARD_SERVICE, ISCGUARD_DISPLAY_NAME, sw_mode, svc_error);
		if (status == SUCCESS)
		    ib_printf ("Service \"%s\" successfully started.\n", ISCGUARD_DISPLAY_NAME);
		else
		    ib_printf ("Service \"%s\" not started.\n", ISCGUARD_DISPLAY_NAME);	}
	else
	{
		status = SERVICES_start (manager, REMOTE_SERVICE, REMOTE_DISPLAY_NAME, sw_mode, svc_error);
		if (status == SUCCESS)
		    ib_printf ("Service \"%s\" successfully started.\n", REMOTE_DISPLAY_NAME);
		else
		    ib_printf ("Service \"%s\" not started.\n", REMOTE_DISPLAY_NAME);
	}

	break;

    case COMMAND_STOP:
	/* Test for use of Guardian. If so, stop the guardian else stop ib-server */
	if (using_guardian (svc_error)==1)
	{
		status = SERVICES_stop (manager, ISCGUARD_SERVICE, ISCGUARD_DISPLAY_NAME, svc_error);
		if (status == SUCCESS)
		    ib_printf ("Service \"%s\" successfully stopped.\n", ISCGUARD_DISPLAY_NAME);
		else
			ib_printf ("Service \"%s\" not stopped.\n", ISCGUARD_DISPLAY_NAME);
	}
	else
	{
		status = SERVICES_stop (manager, REMOTE_SERVICE, REMOTE_DISPLAY_NAME, svc_error);
		if (status == SUCCESS)
		    ib_printf ("Service \"%s\" successfully stopped.\n", REMOTE_DISPLAY_NAME);
		else
			ib_printf ("Service \"%s\" not stopped.\n", REMOTE_DISPLAY_NAME);
	}

	break;

    }

CloseServiceHandle (manager);

exit ((status == SUCCESS) ? FINI_OK : FINI_ERROR);
}

static USHORT svc_error (
    SLONG	status,
    TEXT	*string,
    SC_HANDLE	service)
{
/**************************************
 *
 *	s v c _ e r r o r
 *
 **************************************
 *
 * Functional description
 *	Report an error and punt.
 *
 **************************************/
TEXT	buffer [512];
SSHORT	l;

if (service != NULL)
    CloseServiceHandle (service);

ib_printf ("Error occurred during \"%s\"\n", string);

if (!(l = FormatMessage (FORMAT_MESSAGE_FROM_SYSTEM,
	NULL,
	status,
	GetUserDefaultLangID(),
	buffer,
	sizeof (buffer),
	NULL)))
    ib_printf ("Windows NT error %d\n", status);
else
    ib_printf ("%s\n", buffer);

return FAILURE;
}

static void usage (void)
{
/**************************************
 *
 *	u s a g e
 *
 **************************************
 *
 * Functional description
 *
 **************************************/

ib_printf ("Usage:\n");
ib_printf ("    instsvc {install InterBase_directory [-auto | -demand] } [-g] [-z]\n");
ib_printf ("            {remove                                        } [-g] \n");
ib_printf ("            {configure [-boostpriority | -regularpriority] }\n");
ib_printf ("            {start     [-boostpriority | -regularpriority] }\n");
ib_printf ("            {stop                                          }\n");

exit (FINI_OK);
}


static USHORT using_guardian (
	USHORT	(*err_handler)())
{
/**************************************
 *

  *	u s i n g _ g u a r d i a n
 *
 **************************************
 *
 * Functional description
 *	Are we using the guardian?
 *
 **************************************/

HKEY	hkey;
SLONG	status;
TEXT	*mode;
DWORD   buffSize;

mode = "0";
buffSize = 2;



if ((status = RegOpenKeyEx (HKEY_LOCAL_MACHINE,
	REG_KEY_ROOT_CUR_VER, 0, KEY_READ, &hkey)) != ERROR_SUCCESS)
    {
    return (*err_handler) (status, "RegOpenKeyEx", NULL);
    }

if ((status = RegQueryValueEx (hkey, "GuardianOptions", NULL, NULL, mode, &buffSize)) != ERROR_SUCCESS)
    {
    RegCloseKey (hkey);
    return (*err_handler) (status, "RegQueryValueEx", NULL);
    }

RegCloseKey (hkey);

return atoi(mode);

};

USHORT guardian_setup (
    USHORT	(*err_handler)())
{
/*************************************************
 *
 *	g u a r d i a n _ s e t u p 
 *
 *************************************************
 *
 * Functional description
 *	Set up the Guardian's registry details
 *
 *************************************************/
HKEY	hkey;
USHORT	len;
SLONG	status;

if ((status = RegOpenKeyEx (HKEY_LOCAL_MACHINE,
	REG_KEY_ROOT_CUR_VER,
	0, KEY_WRITE, &hkey)) != ERROR_SUCCESS)
    {
    return (*err_handler) (status, "RegOpenKeyEx", NULL);
    }

if (status = RegSetValueEx (hkey, "GuardianOptions", 0,REG_SZ, "1", 2 )  != ERROR_SUCCESS)
    {
    return (*err_handler) (status, "RegSetValueEx", hkey);
    }

RegCloseKey (hkey);

return SUCCESS;
}


