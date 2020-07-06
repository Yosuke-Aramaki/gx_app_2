# README

## 概要
タスクベースでふりかえりができるアプリです。\
最初に大タスク中タスクを書き出して、1日ごとに大中タスクに基づいての振り返りができようになっています。

## Developer's guide

### インストール
```
git clone git@github.com:Yosuke-Aramaki/pilee.git
cd pilee
git checkout develop
```

### rbenv, MySQLのインストール

*インストール済の方はこの手順を飛ばしてください

```
// rbenvのインストール
$ rbenv install 1.1.2
$ rbenv exec gem install bundler
```

```
// MySQLのインストール 
brew update
brew install mysql
brew info mysql // インストールの確認
 mysql: stable 8.0.19 (bottled)
```

### データベース設定ファイル

データベース設定ファイルを作成します
```
touch config/database.yml
```

作業ユーザー名とパスワードを指定して作成されたファイルを下記の内容に書き換えます

```/config/database.yml
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: 5
  username: root
  password:
  host: 127.0.0.1

development:
  <<: *default
  database: pilee_development

production:
  <<: *default
  database: pilee_production
  username: sample
  password: <%= ENV['SAMPLE_DATABASE_PASSWORD'] %>

```

### dockerの起動

```
//dockerのアプリを起動した状態で
$ docker-compose -up d

// DBに接続
$ mysql -u root -h 127.0.0.1
```

### プロジェクトの起動

```
bundle install --path=vendor
rails db:create
rails db:migrate
rails server
```

