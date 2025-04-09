# rss repo

from the root folder run this command to update the crontab to auto update rss every 6 hours
this updates this repo rss'es and the opml file
`(crontab -l; cat auto-update.cron.md) | crontab -`

to update crontab manually just paste to the file
EDITOR="nano" crontab -e
`0 */6 * * * cd /home/rodhfr/Docker/podsync/data && git add . && git commit -m "Auto-commit" && git push`





