# Podsync Public RSS Feed Repo

## Dependencies 
* Podsync
* Cronie
## Setup Auto Updating
```bash
# add this remote repo to your podsync data folder remote path 
sh setup_auto_update.sh
```
setup_auto_update.sh just creates a cron job that auto updates rss from this folder every 6 hours (configurable via cron syntax).

## Import OPML file to your player of choice
```bash
wget https://raw.githubusercontent.com/rodhfr/rss/refs/heads/main/podcasts.opml # Change to your git username and repository`
```

#### PocketCasts
[Import OPML](https://play.pocketcasts.com/settings/import-export)

## TODO

- [x] implement a way to auto create opml with github raw links to easily import to aggregators


