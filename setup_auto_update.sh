#!/bin/bash

default_cron="0 */6 * * *"

function is_valid_cron() {
    local cron="$1"
    if [[ "$cron" =~ ^([0-9*/,-]+[[:space:]]+){4}[0-9*/,-]+$ ]]; then
        return 0
    else
        return 1
    fi
}

read -p "Use default schedule '$default_cron'? (y/n): " cron_confirm
if [[ "$cron_confirm" == "y" || "$cron_confirm" == "Y" ]]; then
    cron_schedule="$default_cron"
else
    while true; do
        read -p "Enter your custom cron schedule (e.g., '*/30 * * * *'): " cron_schedule
        if is_valid_cron "$cron_schedule"; then
            break
        else
            echo "❌ Invalid cron format. Please enter a valid 5-field cron string."
        fi
    done
fi

read -p "The current folder is where your git repo is located? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    read -p "Auto update this path '$(pwd)'? (y/n): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Re-run this script to retry."
        exit 1
    fi
    current_path=$(pwd)
else
    read -p "Paste the absolute path of your git repo: " custom_path 
    read -p "Confirm '$custom_path' as git repo auto-update path? (y/n): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Re-run this script to retry."
        exit 1
    fi
    current_path="$custom_path"
fi

echo "✅ Auto-updating the git repo at '$current_path' using schedule '$cron_schedule'"

# Final cron job string with correct separator
cron_job="$cron_schedule cd '$current_path' && git add . && git commit -m 'auto-commit' && git push"

# Check and update crontab
if crontab -l 2>/dev/null | grep -Fxq "$cron_job"; then
    echo "⚠️ This cron job is already in the crontab. Skipping."
else
    (crontab -l 2>/dev/null; echo "$cron_job") | crontab -
    echo "✅ Crontab updated successfully!"
fi

