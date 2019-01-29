#!/bin/bash

echo "DockerでRedmineを構築するスクリプト"
echo "データは ~/var/redmine 配下に保存されます"
echo -n "構築を開始します。 [yes/no] "
read answer
if [ "$answer" != "yes" ]; then
  echo "終了します"
  exit
fi

docker-compose up -d

sleep 20

docker exec -it $(docker-compose ps -q redmine) /usr/src/redmine/inst/setup.sh

echo "以下を実施してください。"
echo " 1) ブラウザにてhttp://0.0.0.0:10080にアクセス、admin / adminでログイン"
echo " 2) 管理メニューよりデフォルト設定をロード"
echo " 3) 管理メニューより  トラッカー ＞ 新しいトラッカー  を選択。下記２つのトラッカーを追加"
echo "      a: ストーリー"
echo "      b: タスク"
echo ""
read -p "先に進めるにはenterを押下して下さい。"

docker-compose exec redmine bundle exec rake redmine:backlogs:install
docker-compose restart

echo ""
echo "構築完了!!"