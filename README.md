# Podsync Public RSS Feed Repo

## Dependencies 
* Podsync
* Cronie
## Setup auto updating
```bash
# add this remote repo to your podsync data folder remote path 
sh setup_auto_update.sh
```
setup_auto_update.sh just creates a cron job that auto updates rss from this folder every 6 hours (configurable via cron syntax).

## import opml file to your player
wget https://raw.githubusercontent.com/rodhfr/rss/refs/heads/main/podcasts.opml # change to your git user and repo

* pocketcasts import opml page
https://play.pocketcasts.com/settings/import-export

### TODO

- [x] implement a way to auto create opml with github raw links to easily import to aggregators such as pocketcasts


