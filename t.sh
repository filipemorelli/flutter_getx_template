#!/usr/bin/env zsh

echo "Find build artifacts"
apkPath=$(find build -name "*prod-release.apk" | head -1)
echo "Found apk at $apkPath"
APP_CENTER_TOKEN="ff51a4a10df911e15b8a20becb99c290b133d3c9"

if [[ -z ${apkPath} ]]
then
    echo "No apks were found, skip publishing to App Center"
else
    echo "Publishing $apkPath to App Center"
    appcenter distribute release \
        --group Collaborators \
        --file "${apkPath}" \
        --release-notes 'App submission via Codemagic' \
        --app morellitecinfo-gmail.com/flutter_getx_template \
        --token "${APP_CENTER_TOKEN}" \
        --quiet
fi