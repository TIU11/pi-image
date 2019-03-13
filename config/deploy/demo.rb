# frozen_string_literal: true

server 'demo.tiu11.org', user: fetch(:user), roles: %w[web app db], ssh_options: {
  forward_agent: true,
  auth_methods: %w[publickey]
}

# Parallelize the installation of gems.
# Choose a number less or equal than the number of cores your server.
set :bundle_jobs, 2
