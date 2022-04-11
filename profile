#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
JAVA_TOOL_OPTIONS="-javaagent:$HOME/bin/lombok.jar -Xbootclasspath/p:$HOME/bin/lombok.jar"
#JAVA_HOME=/usr/lib/jvm/java-11-openjdk
#JAVA_HOME=/usr/lib/jvm/zulu11.54.25-ca-jdk11.0.14.1-linux_x64

PATH=$PATH:$JAVA_HOME/bin

export JAVA_HOME
export JAVA_TOOL_OPTIONS
export PATH
export SWT_GTK3=1

# prevents eclipse from blinking in KDE Plasma
export GTK_IM_MODULE=ibus 
