require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SesaiPdsi
  class Application < Rails::Application
    config.autoload_paths << "#{Rails.root}/app/validators"
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = 'pt-BR'
    config.active_record.raise_in_transactional_callbacks = true
    config.encoding = 'utf-8'
    config.nav_lynx.selected_class = 'is-active'
    config.assets.precompile += ['pdf.css']
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
