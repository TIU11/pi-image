# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'pi-image'
set :top_level_domain, 'tiu11.org'
set :repo_url, "https://github.com/TIU11/#{fetch(:application)}.git"
set :user, `whoami`.strip.to_s

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, "/export/home/#{fetch(:top_level_domain)}/#{fetch(:application)}"

# Path that works with multi-user deploys, and doesn't get chown'ed by :update_group.
# Avoids `/tmp/<application>/git-ssh.sh: Permission denied` when another user attempts to deploy.
# @see (https://github.com/capistrano/capistrano/issues/687#issuecomment-35419084)
set :tmp_dir, "/tmp/#{fetch(:user)}/ssh-kit"

# RVM: Capistrano deploys with server's default ruby, but we want to match the local environment
set :rvm_ruby_version, ENV['GEM_HOME'].gsub(%r{.*/}, '') # match local ruby environment

# Passenger
set :passenger_restart_with_sudo, true # assumes suders allows the deploy user to restart w/o a password

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w[config/database.yml]
set :linked_files, %w[.env config/master.key]

# Default value for linked_dirs is []
# set :linked_dirs, %w[bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system  public/packs node_modules]
set :linked_dirs, %w[log tmp/pids tmp/cache]

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

namespace :deploy do

  # before :restart, :update_group

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
