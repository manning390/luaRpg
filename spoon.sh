#!/bin/bash
# Takes a CamelCase class name to generate a lua class for DinoDeck engine
PROJECT='/d/Railalis/Documents/Code/lua/luaRpg'
SCRIPTS='scripts'
DEP='Dependencies.lua'
# wut? Just go with it
NAME=${1%\.lua}
CLASS=${NAME##*\/}
FILE=$PROJECT/$SCRIPTS/$NAME.lua
DIRS=${FILE%$CLASS\.lua}

overwrite() { echo -e "\r\033[1A\033[0K$@"; }

# Maybe one day
# echo "Tarnishing the spoons.."
# unalias spoon 2>/dev/null
# alias spoon="$PROJECT/spoon.sh"

echo "Creating directories..?"
mkdir -p $DIRS

overwrite "Creating $NAME.lua file.."
touch $FILE
echo "$CLASS = {}" >> $FILE
echo "$CLASS.__index = $CLASS" >> $FILE

overwrite "Adding to manifest.."
sed -i "$(expr $(wc -l < $PROJECT/manifest.lua) - 1)i\\\t\t['$CLASS.lua'] = { path = '$SCRIPTS/$NAME.lua' }," $PROJECT/manifest.lua

overwrite "Adding to $DEP.."
sed -i "$(wc -l < $PROJECT/$SCRIPTS/$DEP)i\\\t\"$CLASS.lua\"," $PROJECT/$SCRIPTS/$DEP

# now open it
subl $FILE
overwrite "Spooned $NAME.lua!"

# Command for total line count
# find . -name '*.lua' -not -path './tutFiles/*' | xargs wc -l | sort
