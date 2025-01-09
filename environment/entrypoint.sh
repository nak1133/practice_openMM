#!/bin/bash
# 環境変数 USER_ID と GROUP_ID が設定されているか確認
if [ ! -z "$USER_ID" ] && [ ! -z "$GROUP_ID" ]; then
    # ユーザーグループとユーザーを作成
    groupadd -g "$GROUP_ID" usergroup
    useradd -u "$USER_ID" -g usergroup -m user
    # gosu を使ってコマンドを実行
    exec gosu user "$@"
else
    exec "$@"
fi
