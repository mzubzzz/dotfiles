#!/bin/bash
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
#JAVA_HOME=/usr/lib/jvm/java-11-openjdk
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME
export PATH
export SWT_GTK3=1
# prevents eclipse from blinking in KDE Plasma
export GTK_IM_MODULE=ibus 
