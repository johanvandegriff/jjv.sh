#!/bin/bash
cd `dirname $0`

sed -i 's,ignoreFiles = \["gallery/.*"\],#ignoreFiles = ["gallery/.*"],g' config.toml
scp config.toml johanv.net:hugo/config.toml
sleep 2
sed -i 's,#ignoreFiles = \["gallery/.*"\],ignoreFiles = ["gallery/.*"],g' config.toml
scp config.toml johanv.net:hugo/config.toml
