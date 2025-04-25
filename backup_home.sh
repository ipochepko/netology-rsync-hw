#!/bin/bash

LOGFILE="/var/log/backup_home.log"
SOURCE="/home/ipochepko/"
DEST="/tmp/backup/"
EXCLUDE=".*/"

mkdir -p "$DEST"

echo "[$(date)] Начало резервного копирования..." >> "$LOGFILE"

rsync -avc --delete --exclude="$EXCLUDE" "$SOURCE" "$DEST" >> "$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
    logger -t backup_home "Резервное копирование успешно завершено."
    echo "[$(date)] УСПЕХ" >> "$LOGFILE"
else
    logger -t backup_home "ОШИБКА при резервном копировании."
    echo "[$(date)] ОШИБКА" >> "$LOGFILE"
fi
