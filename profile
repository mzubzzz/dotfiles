#!/bin/bash

# JAVA_HOME=/usr/lib/jvm/zulu11.74.15-ca-jdk11.0.24-linux_x64
# JAVA_HOME=/usr/lib/jvm/amazon-corretto-11.0.24.8.1-linux-x64
# JAVA_HOME=/usr/lib/jvm/amazon-corretto-17.0.12.7.1-linux-x64
JAVA_HOME=/usr/lib/jvm/amazon-corretto-21.0.4.7.1-linux-x64
# JAVA_TOOL_OPTIONS="-javaagent:$HOME/bin/lombok.jar -Xbootclasspath/p:$HOME/bin/lombok.jar"

PATH_TO_FX=/usr/lib/jvm/javafx-sdk-21.0.1/lib

PATH=$PATH:$JAVA_HOME/bin:$PATH_TO_FX


export JAVA_HOME
export PATH_TO_FX
#export JAVA_TOOL_OPTIONS
export PATH
export SWT_GTK3=1

# prevents eclipse from blinking in KDE Plasma
export GTK_IM_MODULE=ibus 
# enhance wayland and awt interaction
export WEBKIT_DISABLE_COMPOSITING_MODE=1
