#!/bin/bash

PROJECT="folia"
MINECRAFT_VERSION="1.20.4"

LATEST_VERSION=$(curl -s https://api.papermc.io/v2/projects/${PROJECT} | \
    jq -r '.versions[-1]')

LATEST_BUILD=$(curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds | \
    jq -r '.builds | map(select(.channel == "experimental") | .build) | .[-1]')

JAR_NAME=${PROJECT}-${LATEST_VERSION}-${LATEST_BUILD}.jar

PAPERMC_URL="https://api.papermc.io/v2/projects/${PROJECT}/versions/${LATEST_VERSION}/builds/${LATEST_BUILD}/downloads/${JAR_NAME}"

curl -o server.jar $PAPERMC_URL
echo "Downloads completed"
