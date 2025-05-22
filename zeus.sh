#!/bin/bash

iterator=0;
zeus_phrase="I AM ZEUS, FEEL MY POWER!"

for iterator in 5
do
    mcrcon -H 13.237.63.199 -P 25575 -p 'PASSWORD' "execute as @a at @s run summon minecraft:lightning_bolt ~ ~ ~"
    mcrcon -H 13.237.63.199 -P 25575 -p 'PASSWORD' "say $zeus_phrase"
    sleep 5
done
