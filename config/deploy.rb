# good example http://hostingrails.com/Capistrano-Deploying-Your-Rails-Application-on-HostingRails-com

set :application, "sample_app"
set :repository,  "git@github.com:katyabain/sample_add.git"

set :scm, :git
set :scm_username, "katyabain"
set :user, "katya"
set :branch, "master"
#set :use_sudo, false
set :copy_exclude, [".git", "spec"]
set :deploy_via, :copy 

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
default_run_options[:pty] = true

set :deploy_to, "/var/www/sample_app"
# read more about it
#set :chmod755, %w(app config db lib public vendor script tmp public/dispatch.cgi public/dispatch.fcgi public/dispatch.rb)

role :web, "superfranklin.com"                          # Your HTTP server, Apache/etc
role :app, "superfranklin.com"                          # This may be the same as your `Web` server
role :db,  "superfranklin.com", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do

#task :setup, :except => { :no_release => true } do
#       dirs = [deploy_to, releases_path, shared_path]
#      dirs += shared_children.map { |d| File.join(shared_path, d) }
#     run "#{try_sudo} mkdir -p #{dirs.join(' ')} && sudo chmod g+w #{dirs.join(' ')}"
#    run "chmod 777 #{shared_path}/log"
# end

#desc "Change group to www-data" 
#task :set_permissions, :roles => [ :app, :db, :web ] do 
#sudo "chown -R #{user}:nginx #{deploy_to}" 
#end 

#desc "Fix file permissions"
#task :fix_file_permissions, :roles => [ :app, :db, :web ] do
#sudo "chmod -R g+rw #{current_path}"
#sudo "chmod -R g+rw #{current_path}/releases" 
#end 
#end

#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
