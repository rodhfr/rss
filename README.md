# Podsync Public RSS Feed Repo

## Dependencies 
* [Podsync](https://github.com/mxpv/podsync)
* Cron
* Bash 
* Python 3.0 or later
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

### PocketCasts
[Import OPML](https://play.pocketcasts.com/settings/import-export)


Known issue: Some of the RSS feeds doesn't import. I believe this is an aggregator side issue with parsing OPML.

## TODO

- [x] Implement a way to auto create opml with github raw links to easily import to aggregators.
- [ ] PocketCasts has a broken OPML import feature, see if this is salvagable.
- [ ] Write PodAntenna import guide

## Known issues:
* PocketCasts doesn't import all the feeds from the OPML file this doesn't happen with others aggregators. See the regularity and other OPML formats. See if they have some documentation somewhere.


