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
tac $PROJECT/manifest.lua | sed "5 i \\\t\t['$NAME.lua'] = { path = '$SCRIPTS/$NAME.lua' }," | tac > $PROJECT/manifest.lua

# echo "Adding to $DEP.."
tac $PROJECT/$SCRIPTS/$DEP | sed "2 i \\\t\"$NAME.lua\"," | tac > $PROJECT/$SCRIPTS/$DEP

# now open it
subl $FILE