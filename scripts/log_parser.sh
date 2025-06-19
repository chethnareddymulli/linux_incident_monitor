#!/bin/bash

DB="monitor_db"
USER="monitorpro"
PASS="parrot"

journalctl _COMM=sshd | grep "Failed password" | tail -n 5 | while read line; do
    MSG="$line"
    TYPE="SSH Failure"
    SEVERITY="Medium"
    TIMESTAMP=$(echo "$line" | awk '{print $1" "$2" "$3}')
    SAFE_MSG=$(echo "$MSG" | sed "s/'/''/g")

    echo "Inserting: $TYPE | $SAFE_MSG | $SEVERITY | $TIMESTAMP"

    sudo mariadb -u "$USER" -p"$PASS" -D "$DB" -e "INSERT INTO incidents (type, message, severity, timestamp) VALUES ('$TYPE', '$SAFE_MSG', '$SEVERITY', STR_TO_DATE('$TIMESTAMP', '%b %d %H:%i:%s'));" 2> error.log

    if [ $? -ne 0 ]; then
        echo "Error inserting record:"
        cat error.log
    fi
done

