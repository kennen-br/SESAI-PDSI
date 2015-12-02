set :domain,          '104.131.128.111'
set :branch,          'master'              # Branch name to deploy. (needed by mina/git)
set :unicorn_env,     'production'

private
def nginx_template
  File.expand_path '../../../samples/nginx_development.conf', __FILE__
end
