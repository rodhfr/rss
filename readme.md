# how to ?
just run manual_update.sh and add the following to crontab:
0 */3 * * * cd 'mnt/largehd/YouTube' && git add . && git commit -m 'auto-commit' && git push

instead of 'mnt/largehd/YouTube' change to your own folder repo (this is the videos are located)

