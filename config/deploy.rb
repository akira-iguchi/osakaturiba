# config valid for current version and patch releases of Capistrano
lock '~> 3.4.1'

set :application, 'osakaturiba'
set :repo_url, 'git@github.com:akira-iguchi/osakaturiba.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :branch, 'master'

# Default _to directory is /var/www/my_app_name
set :deploy_to, '/var/www/rails/osakaturiba'

# シンボリックリンクをはるファイル。
set :linked_files, fetch(:linked_files, []).push('config/credentials/production.key')
set :linked_files, fetch(:linked_files, []).push('config/master.key')

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs,
    fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :rbenv_type, :user

set :conditionally_migrate, true

# rubyのバージョン
set :rbenv_ruby, '2.6.3'

# 出力するログのレベル。
set :log_level, :debug

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |_host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  desc 'upload master.key'
  task :upload do
    on roles(:app) do |_host|
      execute "mkdir -p #{shared_path}/config" if test "[ ! -d #{shared_path}/config ]"
    end
  end
  # before :starting, ':upload'
  # after :finishing, ':cleanup'

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
