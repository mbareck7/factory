#!/bin/bash

apk=$1
d2j="/opt/dex2jar-2.0/d2j-dex2jar.sh"
java="/usr/bin/java"
$d2j -f $apk

$java -jar /opt/jd-gui-1.6.6.jar &