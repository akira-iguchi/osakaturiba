#Docker Image を指定します。使用しているアプリのバージョンを指定します。
FROM ruby:2.6.3

# 必要なパッケージのインストール。
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y default-mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの作成、設定
RUN mkdir /workdir
WORKDIR /workdir

# ホスト側（ローカル）のGemfileを上記で作成した/workdirに追加する
ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

# Gemfileのbundle install　
ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler
RUN bundle install

# ホスト側（ローカル）の全てのディレクトリをDocekrコンテナの/workdir配下に追加。
ADD . /workdir