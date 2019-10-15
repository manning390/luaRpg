#!/bin/bash
# Takes a CamelCase class name to generate a lua class for DinoDeck engine
PROJECT='/d/Railalis/Documents/Code/lua/luaRpg'
SCRIPTS='scripts'
DEP='Dependencies.lua'
NAME=$1
FILE=$PROJECT/$SCRIPTS/$NAME.lua

# echo "Creating $NAME.lua file.."
touch $FILE
echo "$NAME = {}" >> $FILE
echo "$NAME.__index = $NAME" >> $FILE

# echo "Adding to manifest.."
sed -i "$(expr $(wc -l < $PROJECT/manifest.lua) - 1)i\\\t\t['$NAME.lua'] = { path = '$SCRIPTS/$NAME.lua' }," $PROJECT/manifest.lua

# echo "Adding to $DEP.."
sed -i "$(wc -l < $PROJECT/$SCRIPTS/$DEP)i\\\t\"$NAME.lua\"," $PROJECT/$SCRIPTS/$DEP

# now open it
subl $FILE

# Command for total line count
# find . -name '*.lua' -not -path './tutFiles/*' | xargs wc -l | sort
