set stages,         %w{ development production }
set default_stage,  'development'

require 'mina/multistage'     # https://github.com/endoze/mina-multistage
require 'mina/bundler'
require 'mina/git'
require 'mina/rvm'
require 'mina/unicorn'        # https://github.com/scarfacedeb/mina-unicorn
require 'mina/hooks'          # https://github.com/elskwid/mina-hooks
require 'mina/nginx'          # https://github.com/hbin/mina-nginx
require 'mina/whenever'

# About unicorn integration:
# It's necessary config tmp/sockets and tmp/pids on shared_paths and
# create_deploy_dirs.

set :application,   'sesai_pdsi'
set :deploy_to,     "/var/www/#{application}"
set :repository,    'git@github.com:kennen-br/SESAI-PDSI.git'
set :user,          'ubuntu'
set :forward_agent, true
set :port,          '22'
set :shared_paths,  %w{ .env log tmp/sockets tmp/pids config/database.yml }

# My settings from mina extensions
set :ruby_version,    '2.2.0'
set :unicorn_config,  'config/unicorn.rb'

# Hooks
before_mina :before_callback
after_mina  :after_callback

task :environment do
  invoke :"rvm:use[#{ruby_version}@default]"
end

# This doesn't invoke rvm things. It's necessary to start process
# when server doesn't have rvm already installed.
task :setup_environment do
end

task setup: :setup_environment do
  invoke :'create_deploy_dirs'
  invoke :'install_dependencies'
  invoke :'install_rvm'
  invoke :'configure_nginx'
end

desc "Deploys the current version to the server."
task deploy: :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    #invoke :'whenever:update'
    invoke :'deploy:cleanup'
    invoke :'nginx:restart'

    to :launch do
      invoke :'unicorn:restart'
    end
  end
end

############################
#     Auxiliar methods     #
############################

# Create all required dirs on deploy dir
task create_deploy_dirs: :setup_environment do
  dirs  = %w{log config tmp/sockets tmp/pids}

  dirs.each do |dir|
    path  = "#{deploy_to}/#{shared_path}/#{dir}"
    queue! %[mkdir -p #{path}]
    queue! %[chmod g+rx,u+rwx #{path}]
  end
end

# Install OS dependencies. Initially thinked to setup.
task install_dependencies: :setup_environment do
  queue! %[sudo aptitude install git nginx libpq-dev libpq-dev npm nodejs -y]
end

# Install RVM from rvm.io recomendations
task install_rvm: :setup_environment do
  rvm_path  = "/home/#{user}/.rvm/bin/rvm"
  queue! %[gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3]
  queue! %[curl -sSL https://get.rvm.io | bash -s stable]
  queue! %[#{rvm_path} reload]
  queue! %[echo "export rvm_max_time_flag=20" >> ~/.rvmrc]
  queue! %[#{rvm_path} install #{ruby_version}]
  queue! %[#{rvm_path} all do gem install bundle]
end

task configure_nginx: :setup_environment do
  invoke :'nginx:setup'
  invoke :'nginx:parse'
  invoke :'nginx:link'
  invoke :'nginx:restart'
end

# Callback to run things before deploy.
# This doesn't run when setup is called.
task before_callback: :environment do
end

# Callback to run things after deploy.
# This doesn't run when setup is called.
task after_callback: :environment do
end

desc 'Rolls back the latest release'
task rollback: :environment do
  queue! %(echo "-----> Rolling back to previous release for instance: #{domain}")

  # Delete existing sym link and create a new symlink pointing to the previous release
  queue %(echo -n "-----> Creating new symlink from the previous release: ")
  queue "echo `cat #{deploy_to}/last_version` | ruby -e 'p gets.to_i-1'"
  queue! %(echo `cat #{deploy_to}/last_version`
    | ruby -e 'p gets.to_i-1'
    | xargs -I active ln -nfs
    '#{deploy_to}/releases/active'
    '#{deploy_to}/ucurrent')

  # Remove latest release folder (active release)
  queue %(echo -n "-----> Deleting active release: ")
  queue "echo `cat #{deploy_to}/last_version`"
  queue! "echo `cat #{deploy_to}/last_version` | xargs -I active rm -rf #{deploy_to}/releases/active"

  # Update the "last_version" file
  queue %(echo -n "-----> Updating last_version file. ")
  queue! "mv #{deploy_to}/last_version #{deploy_to}/del_version"
  queue! "echo `cat #{deploy_to}/del_version` | ruby -e 'p gets.to_i-1' > #{deploy_to}/last_version"
  queue! "rm #{deploy_to}/del_version"

  to :launch do
    invoke :'unicorn:restart'
  end
end

desc 'Stop server'
task stop: :environment do
  invoke :'unicorn:stop'
  invoke :'nginx:stop'
end

desc 'Restart server'
task restart: :environment do
  invoke :'unicorn:restart'
  invoke :'nginx:restart'
end

desc 'Drop, create, migrate and seed data base'
task purge: :environment do
  invoke :'unicorn:stop'
  invoke :'nginx:stop'
  queue! "cd #{deploy_to}/current"
  queue %(echo -n "-----> Droping DB. ")
  queue! 'bin/rake db:drop RAILS_ENV=production'
  queue %(echo -n "-----> Creating DB. ")
  queue! 'bin/rake db:create RAILS_ENV=production'
  queue %(echo -n "-----> Migrating DB. ")
  queue! 'bin/rake db:migrate RAILS_ENV=production'
  queue %(echo -n "-----> Seeding DB. ")
  queue! 'bin/rake db:seed RAILS_ENV=production'
  invoke :'unicorn:restart'
  invoke :'nginx:restart'
end
