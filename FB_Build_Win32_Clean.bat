:: The contents of this file are subject to the Independant
:: Developers Public License Version 1.0 (the "License").
:: You may not use this file except in compliance with the License.
:: You may obtain a copy of the License at http://www.ibphoenix.com/IDPL.html
:: 
:: Software distributed under the License is distributed on an
:: "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express
:: or implied. See the License for the specific language governing
:: rights and limitations under the License.

:: The Original Code was created by Paul Reeves. Portions created
:: by him are Copyright (C) Paul Reeves.
:: 
:: All Rights Reserved.
:: Contributor(s): _______________________________________________.
::

@echo off
::  This batch file is used to clean a source tree that has
::  previously built a version of Firebird. It primarily removes
::  object files, debug files (*.sbr,*.pdb) and the builds in the
::  interbase and ib_debug directories
:: 
:: This script originally built by Paul Reeves 13-Apr-2001
::
:: Last updated by Paul Reeves 01-Nov-2001

if NOT "%1"=="do_it" goto :HELP

echo Cleaning source tree ...

set IB_COMPONENTS=alice burp dsql dudley example5 extlib gpre intl ipserver isql iscguard jrd lock msgs qli remote utilities wal

for %%V in (%IB_COMPONENTS%) do (
  cd %%V
  echo cleaning component %%V ...
  del /q *.sbr
  del /q *.pdb
  del /q *.exe
  del /q *.gdb
  del /q makefile.lib
  rmdir /s /q MS_obj
  cd ..
  )

rmdir /s /q interbase
rmdir /s /q ib_debug

del /q include.mak
del /q compress_dbs.bat
del /q expand_dbs.bat
del /q *template.bat
del /q expand_cfile.bat
del /q builds_win32\*.sed
del /q builds_win32\metadata.gdb

(goto :EOF)

:HELP
@echo:
@echo   This script must be run from the top of source directory
@echo   tree. It is quite dangerous, as it will delete whole directory
@echo   trees without prompting. However, they are generated by the
@echo   build process, so you shouldn't have put your stuff there
@echo   anyway.
@echo:
@echo   To run this script pass "do_it" as a parameter.
@echo:
@echo     ie FB_Build_Win32_Clean.bat do_it
@echo:


:EOF


