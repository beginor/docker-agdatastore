#!/bin/bash -e

AGS_HOME=/arcgis/datastore

# a function to start arcgis datastore using its startup script.
function start_arcgis_datastore {
    $AGS_HOME/startdatastore.sh
}

# a function to stop arcgis datastore using its shutdown script.
function stop_arcgis_datastore {
    $AGS_HOME/stopdatastore.sh
}

# a function that spins, stopping every 1s to check if any arcgis
# processes are running. the loop terminates when no running arcgis
# processesa are found.
function wait_for_exit {
    while pgrep -f $AGS_HOME > /dev/null; do
        /bin/sleep 1
    done
    echo "All ArcGIS datastore processes have stopped."
}

# a function that is called whenever a signal is caught requesting that
# the process be terminated. in most cases, this will come from Docker
# as this script will be running as PID 1.
function signal_trap {
    echo "A SIGTERM or SIGINT signal was caught; trying to shut down."
    stop_arcgis_datastore
}

# trap termination signals and stop the datastore processes. this is
# necessary because Docker will send SIGTERM to the container's
# PID 1 when it tries to stop the container. since Bash doesn't
# pass this along, we have to handle it ourselves.
trap signal_trap SIGTERM SIGINT

# begin the datastore startup process.
start_arcgis_datastore

echo "Listening for termination signals..."
# loop until all arcgis processes are finished.
wait_for_exit
