#!/bin/bash
src=~/git/johanvandegriff/jjv.sh/
dst=confuzer:/brick/websites/docker/jjv.sh/hugo/

sed -i 's,ignoreFiles = \["gallery/.*"\],#ignoreFiles = ["gallery/.*"],g' "$src/config.toml"
sed -i 's,cleanDestinationDir = false,cleanDestinationDir = true,g' "$src/config.toml"
scp "$src/config.toml" "$dst/config.toml"

sleep 2

sed -i 's,#ignoreFiles = \["gallery/.*"\],ignoreFiles = ["gallery/.*"],g' "$src/config.toml"
sed -i 's,cleanDestinationDir = true,cleanDestinationDir = false,g' "$src/config.toml"
scp "$src/config.toml" "$dst/config.toml"
