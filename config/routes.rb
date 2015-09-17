Rails.application.routes.draw do

  scope '/meu-pdsi' do
    get   '/(ver/:section)',        to: 'pdsis#index',  as: :pdsis
    patch '/:id/alterar/:section',  to: 'pdsis#update', as: :pdsi
    get   '/:id/alterar/:section',  to: 'pdsis#edit',   as: :edit_pdsi

    scope '/dados-demograficos' do
      patch '/:id/alterar',  to: 'demographic_datas#update',  as: :demographic_data
      get   '/:id/alterar',  to: 'demographic_datas#edit',    as: :edit_demographic_data
    end
  end

  scope '/templates' do
    get   '/',                      to: 'text_templates#index',   as: :text_templates
    patch '/:id/alterar/:section',  to: 'text_templates#update',  as: :text_template
    get   '/:id/alterar/:section',  to: 'text_templates#edit',    as: :edit_text_template
  end

  devise_for  :users, path: '', path_names: { sign_in: 'entrar', sign_out: 'sair', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources   :users, path: 'usuarios', path_names: { new: 'cadastrar', edit: 'alterar' }
  get         '/alterar-senha',   to: 'users#edit_password',    as: :edit_password
  patch       '/alterar-senha', to: 'users#update_password',  as: :update_password

  get '/health',    to: 'application#health'

  root 'users#home'
end
