# Podsync Public RSS Feed Repo

## Dependencies 
* Podsync
* Cronie
## Setup
```bash
# add this remote repo to your podsync data folder remote path 
sh setup_auto_update.sh
```
setup_auto_update.sh just creates a cron job that auto updates rss from this folder every 6 hours (configurable via cron syntax).


### TODO

- [ ] implement a way to auto create opml with github raw links to easily import to aggregators such as pockecasts

