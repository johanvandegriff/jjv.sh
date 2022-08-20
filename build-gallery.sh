#!/bin/bash
cd `dirname $0`

sed -i 's,ignoreFiles = \["gallery/.*"\],#ignoreFiles = ["gallery/.*"],g' config.toml
sed -i 's,cleanDestinationDir = false,cleanDestinationDir = true,g' config.toml
scp config.toml johanv.net:hugo/config.toml

sleep 2

sed -i 's,#ignoreFiles = \["gallery/.*"\],ignoreFiles = ["gallery/.*"],g' config.toml
sed -i 's,cleanDestinationDir = true,cleanDestinationDir = false,g' config.toml
scp config.toml johanv.net:hugo/config.toml
