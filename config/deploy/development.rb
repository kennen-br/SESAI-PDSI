set :domain,          '162.243.153.150'
set :branch,          'rc'              # Branch name to deploy. (needed by mina/git)
set :unicorn_env,     'production'

private
def nginx_template
  File.expand_path '../../../samples/nginx_development.conf', __FILE__
end
