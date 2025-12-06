FILENAME="$1"
DURATION="$2"

COUNTER=$DURATION
FLAG=true

pattern=$"["$(date +"%d.%m")$"](http://"$(date +"%d.%m")"/)."$(date +"%y")" "$(date +"%H:%M")" = "
info=$pattern$(cat /proc/loadavg)

while true
  do
  if [ "$COUNTER" = "1" ]; then
    COUNTER=$DURATION
    echo "$info" >> "$FILENAME"
    info=""
    echo "Информация сохранена"
  else
    COUNTER=$(($COUNTER - 1))
  fi

  new_info=$pattern$(cat /proc/loadavg)
  info=$info$'\n'$new_info
  sleep 1
done
