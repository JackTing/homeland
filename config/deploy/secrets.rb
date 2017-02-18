###
### SECRETS
################################################################################

namespace :secrets do
  desc "Upload secret configuration files"
  task :upload do
    scp_upload("#{app_root}/config/{redis,secrets,database,config,elasticsearch,cable,sidekiq}.yml", "#{deploy_to}/#{shared_path}/config/", verbose: true)
  end
end