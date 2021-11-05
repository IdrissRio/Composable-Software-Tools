#!/bin/zsh

# Author: Idriss Riouak 
# Date: 05/11/2021
# E-mail: idriss.riouak@cs.lth.se

### Setting the environment
. ~/.sdkman/bin/sdkman-init.sh
sdk use java 8.0.275.fx-zulu

cd JAVA2AST
./gradlew clean build

cd ..
cd Replace
./gradlew clean build

cd ..
cd Filter
./gradlew clean build


