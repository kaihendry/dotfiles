#!/bin/sh

SNIPS=${HOME}/snippets

FILE=`ls ${SNIPS} | /usr/bin/rofi -dmenu`

if [ -f ${SNIPS}/${FILE} ]; then
  DATA=$([ -x "${SNIPS}/${FILE}" ] && bash "${SNIPS}/${FILE}" || head --bytes=-1 ${SNIPS}/${FILE})
  printf "$DATA" | xsel -p -i
  printf "$DATA" | xsel -b -i
  xdotool key shift+Insert
fi
