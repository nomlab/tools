#!/bin/bash

basename=$(basename $0)

if [ "$1" ]
then
    year=$2
    next_year=$(($year+1))
    result_file=${1/.ics/}_update_year.ics
    mid_file="mid.ics"
    calendar_end=$(tail -n 1 $1)

    # カレンダ定義のためのoffsetを最初に確保
    calendar_offset=$(($(grep BEGIN:VEVENT -n $1 | sed -e 's/:.*//g' | head -n 1)-1)) #最初のBEGIN:VEVENTを含まないようにするため
    sed -n "1, ${calendar_offset}p" $1 > $result_file
    sed "1, ${calendar_offset}d" $1 > $mid_file

    # dtstart:yyyyを含むイベントを抽出
    i=$(grep DTSTART:$year $mid_file | head -n 1)
    while [ "$i" ]
    do
        event_start=$(($(grep DTSTART:${year} -n $mid_file | sed -e 's/:.*//g' | head -n 1)-1)) # 最初のDTSTARTと，BEGIN:VEVENTを追加するため
        event_end=$(($(tail -n +$event_start $mid_file | grep END:VEVENT -n  | sed -e 's/:.*//g' | head -n 1)+$event_start-1)) # 次のBEGIN:VEVENTを含まないようにするため，-1
        sed -n "${event_start}, ${event_end}p" $mid_file >> $result_file
        tmp=$(sed "1, ${event_end}d" $mid_file)
        echo "$tmp" > "$mid_file"
        i=$(grep DTSTART:$year $mid_file | head -n 1)
    done

    # yearをnext_yearに置換
    result=$(sed "s/$year/$next_year/g" $result_file)
    echo "$result" > "$result_file"

    # 終了処理
    echo "$calendar_end" >> $result_file
    rm $mid_file

else
    echo "Usage: bash $basename <filename> yyyy"
    echo "<filename> shoule be filename for ics file."
    echo "If you exec this script, '<filename>_update_year.ics' is generated."
    echo "This file include script result."
fi
