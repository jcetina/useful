#!/bin/bash
PROFILEDIR="$HOME/Library/Application Support/Google/Chrome/Profile 1/"
cp "$PROFILEDIR/History" History.bak
sqlite3 -csv -readonly History.bak <extract_gh_urls.sql | cut -d, -f2 | awk 'match($0, /https:\/\/github\.com\/github\/[^\/\#\r]*/) {print substr($0, RSTART, RLENGTH)}' | sort | uniq -c | sort -rn > gh_urls_sorted.txt
rm History.bak
