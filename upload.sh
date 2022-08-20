#!/bin/bash
rsync -aP --itemize-changes --delete ~/git/johanvandegriff/johanv.net/ johanv.net:hugo/ --exclude public --exclude resources/_gen $@
