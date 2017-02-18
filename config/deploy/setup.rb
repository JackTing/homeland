###
### SETUP
################################################################################

task setup: :environment do
  queue %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue %[mkdir -p "#{deploy_to}/#{shared_path}/tmp"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp"]

  queue %[mkdir -p "#{deploy_to}/#{shared_path}/run"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/run"]

  queue %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/pids"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/pids"]

  queue %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/sockets"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/sockets"]

  queue %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue %[mkdir -p "#{deploy_to}/#{shared_path}/public"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/public"]

  queue %[mkdir -p "#{deploy_to}/#{shared_path}/public/system"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/public/system"]

  queue %[mkdir -p "#{deploy_to}/#{shared_path}/public/uploads"]
  queue %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/public/uploads"]

  queue! %[touch "#{deploy_to}/shared/tmp/sockets/puma.state"]
  queue  %[echo "-----> Be sure to edit 'shared/tmp/sockets/puma.state'."]

  queue! %[touch "#{deploy_to}/shared/log/puma.stdout.log"]
  queue  %[echo "-----> Be sure to edit 'shared/log/puma.stdout.log'."]

  queue! %[touch "#{deploy_to}/shared/log/puma.stderr.log"]
  queue  %[echo "-----> Be sure to edit 'shared/log/puma.stderr.log'."]

  queue! %[touch "#{deploy_to}/shared/log/sidekiq.log"]
  queue  %[echo "-----> Be sure to edit 'shared/log/sidekiq.log'."]

  queue %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
end



