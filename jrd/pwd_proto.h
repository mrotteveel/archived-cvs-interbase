/*
 *	PROGRAM:	JRD Access Method
 *	MODULE:		pwd_proto.h
 *	DESCRIPTION:	Prototype header file for pwd.c
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
 * $Id$
 */

#ifndef _JRD_PWD_PROTO_H_
#define _JRD_PWD_PROTO_H_

extern void	PWD_get_user_dbpath (TEXT *);
extern void	PWD_verify_user (TEXT *, TEXT *, TEXT *, TEXT *, 
				int *, int *, int *);
extern char *PWD_ls_user(void);
extern char *PWD_ls_pw(void);

#endif /* _JRD_PWD_PROTO_H_ */
