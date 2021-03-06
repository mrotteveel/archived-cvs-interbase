/*
 *      PROGRAM:        JRD Access Method
 *      MODULE:         iutlswep.c
 *      DESCRIPTION:    IUTLS.DLL cleanup functions
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
#include "../jrd/node_proto.h"
#include "../jrd/gds_proto.h"

int DLL_EXPORT LOCAL_wep(void)
{
#ifdef	WEP_MEMORY_CLEANUP
    NODE_wep();
    UTLD_wep();
    gdswep();    
#endif
    TRACE ("Called and returning from iutlswep.c LOCAL_wep()...\n");
    return 1;
}
#endif
