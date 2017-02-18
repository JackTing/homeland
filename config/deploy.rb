require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina/puma'
require 'mina/scp'

### Needed to ask for postgresql password
require 'highline/import'



###
### SERVER
################################################################################

set :domain,                '121.40.116.13'                       # Server ip or domain
set :user,                  'admin'                               #  Server user
set :forward_agent,          true                                # SSH key

set :app_name,              'Spirit'                              # App name

set :app_root,              '/Users/powermedia/Development/Spirit' # Local path to application
set :template_path,         "#{app_root}/config/deploy/templates" # Local path to deploy templates

set :deploy_to,             "/home/#{user}/www/#{app_name}"           # Where to deploy

set :repository,            'git@bitbucket.org:JackTing/spirit.git'   # What to deploy
set :branch,                'master'                              # Which branch to deploy

set :shared_paths,          ['config/database.yml',               # Database config
                             'config/config.yml',                 
                             'config/secrets.yml',
                             'config/sidekiq.yml',
                             'config/redis.yml',
                             'public/uploads',
                             'public/system',                     # Image uploads
                             'log',                               # Log files
                             'tmp'
                            ]
###
### TASKS
################################################################################

require_relative 'deploy/essentials'
require_relative 'deploy/setup'
require_relative 'deploy/imagemagick'
require_relative 'deploy/postgresql'
require_relative 'deploy/nodejs'
require_relative 'deploy/redis'
require_relative 'deploy/rbenv'
require_relative 'deploy/puma'
require_relative 'deploy/nginx'
require_relative 'deploy/secrets'
require_relative 'deploy/sidekiq'
require_relative 'deploy/search'
### Load rbenv into the session
task :environment do
  invoke :'rbenv:load'
end

###
### MINA DEPLOY
################################################################################

desc "Deploys the current version to the server."
task deploy: :environment do
  to :before_hook do
    # Put things to run locally before ssh
  end

  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'puma:restart'
      invoke :'sidekiq:start'
    end
  end
end