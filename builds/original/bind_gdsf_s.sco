# The contents of this file are subject to the Interbase Public
# License Version 1.0 (the "License"); you may not use this file
# except in compliance with the License. You may obtain a copy
# of the License at http://www.Inprise.com/IPL.html
#
# Software distributed under the License is distributed on an
# "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express
# or implied. See the License for the specific language governing
# rights and limitations under the License.
#
# The Original Code was created by Inprise Corporation
# and its predecessors. Portions created by Inprise Corporation are
# Copyright (C) Inprise Corporation.
#
# All Rights Reserved.
# Contributor(s): ______________________________________.
#ident "InterBase V3.1 shared UDF library"
#address .text 0xa4000000
#address .data 0xa4400000
#target /shlib/libgdsf_s
#branch
    FUNCTIONS_entrypoint	1
#objects
    source/jrd/shrfinit.bin
    source/jrd/functions.bin
#init source/jrd/shrfinit.bin
    _libfun_strcmp		strcmp
    _libfun_sprintf		sprintf