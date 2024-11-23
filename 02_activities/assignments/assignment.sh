#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

mkdir analysis output
touch README.md
#Line below was the first change made by the coworkers. It creates a new file README.md in the pwd
#with the following words  within it:  "# Project Name: DSI Consulting Inc."
echo "# Project Name: DSI Consulting Inc." > README.md
touch analysis/main.py

# download client data
wget -O rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data

mkdir data

# 2. Move the ./rawdata directory to ./data/raw

mv ./rawdata ./data/raw

# 3. List the contents of the ./data/raw directory
ls ./data/raw

# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs

mkdir ./data/processed
mkdir ./data/processed/server_logs  ./data/processed/user_logs  ./data/processed/event_logs


# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs

cp ./data/raw/server_log_*.log ./data/processed/server_logs


# 6. Repeat the above step for user logs and event logs

cp ./data/raw/user_log_*.log ./data/processed/user_logs
cp ./data/raw/user_ipaddr_*.log ./data/processed/user_logs
cp ./data/raw/event_log_*.log ./data/processed/event_logs


#In the line below (starting with 'For user privacy...'), the word 'all' has been changed to 'alil' by the coworkers. This was  not being picked up by bash since the word in question is in a line which has been commented out.
# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
#
#Line below is the second change made by the coworkers that was picked up by bash. This change appears to be a mistake and hence I am commenting out 
#the entire line. A bash command line starting with rf would be syntactically incorrect. If we assume the line should have
#started with rm and the objective was to remove the entire directory (folder) named 'data' that would not be in accordance with the assignment instructions
#
#rf -rf ./data

rm ./data/raw/*ipaddr*.*
rm ./data/processed/user_logs/*ipaddr*.log 

# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed

ls ./data/processed/event_logs >> ./data/processed/inventory.txt 
ls ./data/processed/server_logs >> ./data/processed/inventory.txt
ls ./data/processed/user_logs >> ./data/processed/inventory.txt

cp ./data/processed/inventory.txt ./data/inventory.txt


###########################################

echo "Project setup is complete!"
