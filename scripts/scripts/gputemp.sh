#/bin/bash

hwmon_file='/sys/class/hwmon/hwmon0/temp1_input'

gputemp=$(cat $hwmon_file)
gputemp=${gputemp%000}

echo ${gputemp}°C
