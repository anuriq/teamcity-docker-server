#!/bin/bash

if [! -d "$TEAMCITY_DATA_PATH/lib"]; then
  echo 'Copy JDBC libs...'
  cp -vR $TEAMCITY_INIT/lib "$TEAMCITY_DATA_PATH/"
fi

if [! -e "$TEAMCITY_DATA_PATH/config/main-config.xml"]; then
  echo 'Restore golden backup...'
  $TEAMCITY_DIST/bin/maintainDB.sh restore -F $TEAMCITY_INIT/backup_clean_aws.zip -T $TEAMCITY_DATA_PATH/config/database.properties
fi

echo '/run-services.sh'
for entry in /services/*.sh
do
  echo "$entry"
  if [[ -f "$entry" ]]; then
      [[ ! -x "$entry" ]] && (chmod +x "$entry"; sync)
      "$entry"
  fi
done

echo '/run-server.sh'
exec '/run-server.sh'
