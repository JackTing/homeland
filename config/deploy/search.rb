namespace :provision do
    desc "Start Elasticsearch"
    task :start_search do
        queue "sudo /etc/init.d/elasticsearch start"
    end
    task :stop_search do
        queue "sudo /etc/init.d/elasticsearch end"
    end

end