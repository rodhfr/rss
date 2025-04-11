#!/bin/bash

echo "This script tries to generate public github opml from the xml file titles in this data folder"
echo "Like this:"
echo "https://raw.githubusercontent.com/\$USER/rss/refs/heads/\$branch_name/\$channel_array[\$i]"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# hardcoding default branch to main
branch_name="main"

echo "This script is located in: $SCRIPT_DIR"


# while true
# do
#     read -p "Input your github username to complete link: " user_input
#     read -p "Confirm username: '$user_input'? (y/n): " confirm
#     if [[ "$confirm" == "Y" || "$confirm" == 'y' ]]; then
#         echo "Using '$user_input' username for the link."
#         git_username="$user_input"
#         break
#     else
#         echo "Failed to save username..."
#     fi
# done
#
# while true
# do
# read -p "Use default branch (main)? (y/n): " confirm
# if [[ "$confirm" == "Y" || "$confirm" == "y" ]]; then
#     echo "Using default branch main"
#     break
# else
#     read -p "type your branch name: " user_input
#     branch_name="$user_input"
#     break
# fi
# done

# TEMPORARY: (For debug only)
git_username="rodhfr"
branch_name="main"

channel_list=$(ls | grep xml)
echo "Displaying xml files from the folder"
echo "$channel_list"

# contagem de linhas
line_count=$(echo -n "$channel_list" | grep -c '^')
declare -i line_count=$line_count # conver to int
echo "Canais encontrados: $line_count" 

# convert multiline string for array
mapfile -t channel_array <<< "$channel_list"


echo "Generating links to file..."
output_file="github_rss.txt" 
> "$output_file"

for ((i=0; i<line_count; i++)); do
    echo "Feed: $(($i+1))"
    channel_array[$i]="https://raw.githubusercontent.com/${git_username}/rss/refs/heads/${branch_name}/${channel_array[$i]}"
    echo "${channel_array[$i]}" | tee -a "$output_file"
done

echo "Links salvos em: $output_file"

sleep 1

python3 ./generate_opml.py

#echo "Removing links from $output_file"
#rm $output_file
echo "done."
