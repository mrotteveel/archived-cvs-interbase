#! /bin/sh

# The pre uninstall routines for Firebird Classic

#------------------------------------------------------------------------
#  stop server if it is running


checkIfServerRunning() {

# Check is server is being actively used.

    checkString=`ps -ef| egrep "(gds_inet_server|gds_pipe)" |grep -v grep`

    if [ ! -z "$checkString" ] 
      then
        echo "An instance of the Firebird/InterBase server seems to be running." 
        echo "Please quit all interbase applications and then proceed." 
        exit 1 
    fi



# Stop lock manager if it is the only thing running.

    for i in `ps -ef | grep "gds_lock_mgr" | grep -v "grep" | cut -d' ' -f3`
     do
        kill $i
     done

}


#= Main PreUn ================================================================
# This is a bit simple, but should work for now.  
# cron will remove files in /tmp after a while. 

    IBRootDir=/opt/interbase
    IBBin=$IBRootDir/bin

    checkIfServerRunning

    cd $IBRootDir
    
    if [ -f isc4.gdb ] 
      then 
        cp isc4.gdb /tmp 
        echo "Saved a copy of isc4.gdb in /tmp" 
    fi 
    
    for i in isc_init1* isc_event1* isc_lock1* interbase.log SYSDBA.password
      do
        if [ -f $i ]
          then
            rm -f $i
        fi
      done
