#!/bin/bash

# ソートされたデータから行ごとの出現回数を数えるスクリプト
# 使用法: ./script.sh < input.txt
# または: sort input.txt | ./script.sh

# 初期化
prev_line=""
count=0

# 標準入力を1行ずつ読み取る
while IFS= read -r line; do
    if [[ "$line" == "$prev_line" ]]; then
        # 同じ行が続く場合はカウントを増加
        ((count++))
    else
        # 新しい行が出現した場合、前の行を出力
        if [[ "$prev_line" != "" ]]; then
            echo "$count $prev_line"
        fi
        # カウントをリセットし、現在の行に切り替え
        prev_line="$line"
        count=1
    fi
done

# 最後の行を出力
if [[ "$prev_line" != "" ]]; then
    echo "$count $prev_line"
fi
