require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/controllers/admin/posts_controller.rb'
  add_filter 'app/controllers/blog/pages_controller.rb'
end
