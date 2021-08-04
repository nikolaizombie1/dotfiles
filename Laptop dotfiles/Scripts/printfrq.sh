#!/bin/bash

freq=$(sudo cpupower frequency-info | grep -e "current CPU frequency: [0-9]" | cut -d ' ' -f 6)
unit=$(sudo cpupower frequency-info | grep -e "current CPU frequency: [0-9]" | cut -d ' ' -f 7)
if [ $unit = "GHz" ]; then
    echo "Your CPU frequency is $freq GHz"
else
    echo "Your CPU frequency is $freq MHz"
fi
echo ""
exit 0
