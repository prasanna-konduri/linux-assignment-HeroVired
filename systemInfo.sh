#!/bin/bash

# Script Name: systemInfo.sh
# Description: This script checks the system information.
# Uptime, memory usage, cpu load,disc usage and running processes.
# Variables:
# REPORT_FILE stores the report file name. 
# UPTIME  uptime of the system
# MEMORY_USAGE memory usage of the system
# CPU_LOAD cpu load of the system
# DISK_USAGE disc usage
# RUNNING_PROCESSES runnig services on the system


# Report file
REPORT_FILE="system_report.txt"

# checking system uptime
UPTIME=$(uptime)

# Checking memory usage
MEMORY_USAGE=$(vm_stat | awk '/free/ {free=$3} /active/ {active=$3} /inactive/ {inactive=$3} /speculative/ {spec=$3} END {print "Free: " free/256 " MB, Active: " active/256 " MB, Inactive: " inactive/256 " MB "}')

# Collect CPU load
CPU_LOAD=$(top -l 1 | grep "CPU usage" | awk '{print "User: " $3 ", System: " $5 ", Idle: " $7}')

# Collect disk usage
DISK_USAGE=$(df -h | grep '^/dev/' | awk '{print $1 ": " $5 " used (" $3 " of " $2 ")"}')

# Collect running processes
RUNNING_PROCESSES=$(ps aux | wc -l)

# Generate the report
echo "System Information Report" > $REPORT_FILE
echo "=========================" >> $REPORT_FILE

echo "System Uptime: $UPTIME" >> $REPORT_FILE

echo "Memory Usage: $MEMORY_USAGE" >> $REPORT_FILE

echo "CPU Load: $CPU_LOAD" >> $REPORT_FILE

echo "Disk Usage: $DISK_USAGE" >> $REPORT_FILE

echo "Number of Running Processes: $RUNNING_PROCESSES" >> $REPORT_FILE

# Display a message indicating the report is complete
echo "System information report has been saved to $REPORT_FILE."

