#!/bin/bash

# Author: Fabio J. Matos Nieves
# Date Created: 4/8/2021
# Last Modified: 4/8/2021

# Description
# This script uses cpupower to print out the current CPU frequency (probably only works for intel CPUs)

# Usage
# ./printfrq.sh

freq=$(sudo cpupower frequency-info | grep -e "current CPU frequency: [0-9]" | cut -d ' ' -f 6)
unit=$(sudo cpupower frequency-info | grep -e "current CPU frequency: [0-9]" | cut -d ' ' -f 7)
if [ $unit = "GHz" ]; then
    echo "Your CPU frequency is $freq GHz"
else
    echo "Your CPU frequency is $freq MHz"
fi
echo ""
exit 0
