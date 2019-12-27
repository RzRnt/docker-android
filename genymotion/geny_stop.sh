#!/bin/bash
types=(saas aws)
case $TYPE in
    "${types[0]}" )
        echo "Stopping all created instances / emulators..."

        # Get the list of created instances from the instance.txt
        if [ ! -f "$INSTANCES_PATH" ]; then
            echo "File not found! Nothing to do!"
            exit 1
        else
            content=$(cat ${INSTANCES_PATH})
            read -a instances <<< $content
            echo "All created instances: ${instances[@]}"

            # Stop the instance one by one
            for i in "${instances[@]}"
            do
                echo "stop instance with id \"${i}\""
                gmsaas instances stop "${i}"
                echo "stopped"
            done
            echo "Done"
        fi
        ;;
    "${types[1]}" )
        contents=$(cat $TEMPLATE)
        echo "ABORT SIGNAL detected! Detroy all EC2 instance(s)..."
        ./terraform destroy -auto-approve -lock=false
        ;;
esac