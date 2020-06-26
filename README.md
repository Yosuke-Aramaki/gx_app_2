# README

## 概要
タスクベースでふりかえりができるアプリです。\
最初に大タスク中タスクを書き出して、1日ごとに大中タスクに基づいての振り返りができようになっています。

## Developer's guide

### インストール
```
git clone git@github.com:Yosuke-Aramaki/pilee.git
cd pilee
```

### MySQLのインストールと設定

*インストール済、また作業ユーザー作成済の方はこの手順を飛ばしてください

```
// MySQLのインストール 
brew update
brew install mysql
brew info mysql // インストールの確認
 mysql: stable 8.0.19 (bottled)
```

```
// MySQLの作業ユーザーの作成
mysql.server start　//MySQLの起動
mysql -u root //MySQLへの接続
mysql> create user 'ユーザー名'@'localhost' identified by 'パスワード１';　//ユーザー名とパスワードを記入してください
mysql> select User,Host from mysql.user;　//作業ユーザーが作成できてるか確認
```

### データベース設定ファイル

データベース設定ファイルを作成します
```
touch /config/database.yml
```

作業ユーザー名とパスワードを指定して作成されたファイルを下記の内容に書き換えます

```/config/database.yml
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: 5
  username: 作業ユーザー名
  password: パスワード
  host: localhost

development:
  <<: *default
  database: pilee_development

production:
  <<: *default
  database: pilee_production
  username: sample
  password: <%= ENV['SAMPLE_DATABASE_PASSWORD'] %>

```

### プロジェクトの起動

```
bundle install
rails db:create
rails db:migrate
rails server
```

