#!/bin/bash

zeus_phrase="I AM ZEUS, FEEL MY POWER!"

for ((i=0; i<5; i++ ))
do
    mcrcon -H 13.237.63.199 -P 25575 -p 'Password' "execute as @a at @s run summon minecraft:limcrcon -H 13.237.63.199 -P 25575 -p 'Rigby1$1Rigby1$1' "say $zeus_phrase"
    sleep 5
done
