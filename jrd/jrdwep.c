/*
 *      PROGRAM:        JRD Access Method
 *      MODULE:         jrdwep.c
 *      DESCRIPTION:    JRD.DLL cleanup functions
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

#include <windows.h>
#include "../jrd/common.h"

#ifdef WINDOWS_ONLY
#include "../jrd/err_proto.h"
#include "../jrd/inuse_proto.h"

int DLL_EXPORT LOCAL_wep(void)
{
    TRACE ("Called jrdwep.c LOCAL_wep()...\n");
#ifdef	WEP_MEMORY_CLEANUP
    ERR_wep();
    INUSE_wep();
    LOCK_wep();
#endif
    TRACE ("jrdwep.c LOCAL_wep():  calling FLU_wep()\n");
    FLU_wep();
    TRACE ("Returning from jrdwep.c LOCAL_wep()...\n");
    return 1;
}
#endif

