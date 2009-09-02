if [ -z $FIRST_LOGIN ]; then
  FIRST_LOGIN="no"
  export FIRST_LOGIN
  
  if [ -w /var/log/ssh ]; then
    exec script -q /var/log/ssh/session.$USER.`date +%Y.%m.%d.%H:%M:%S:%Z`.$$
  fi

  # never come here
  exit;
fi
