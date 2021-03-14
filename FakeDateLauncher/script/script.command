#!/bin/bash
#

function _helpDefaultWrite()
{
    VAL=$1
    local VAL1=$2

    if [ ! -z "$VAL" ] || [ ! -z "$VAL1" ]; then
    defaults write "${ScriptHome}/Library/Preferences/profdrluigi.FakeDate.plist" "$VAL" "$VAL1"
    fi
}

function _helpDefaultRead()
{
    VAL=$1

    if [ ! -z "$VAL" ]; then
    defaults read "${ScriptHome}/Library/Preferences/profdrluigi.FakeDate.plist" "$VAL"
    fi
}

ScriptHome=$(echo $HOME)
#NodeId=$( _helpDefaultRead "NodeId" )
volume_name=$( diskutil info "$NodeId" | grep "Volume Name" | sed 's/.*://g' | xargs )
MY_PATH="`dirname \"$0\"`"
cd "$MY_PATH"

function _start_app()
{
    cp ../bin/* /private/tmp/.
    echo "bla"
}

$1