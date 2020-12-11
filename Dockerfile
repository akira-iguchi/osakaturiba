FROM ruby:2.6.3

# リポジトリを更新し依存モジュールをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# ルート直下にwebappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /osakaturiba
WORKDIR /osakaturiba

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /osakaturiba/Gemfile
ADD Gemfile.lock /osakaturiba/Gemfile.lock

ENV LANG="ja_JP.UTF-8"

RUN gem install bundler
# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /osakaturiba

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets