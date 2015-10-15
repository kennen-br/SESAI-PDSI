Rails.application.routes.draw do

  scope 'pessoas' do
    post '/cadastrar', to: 'people#create',  as: :people_create
  end

  post '/image-upload', to: 'application#image_upload', as: :image_upload

  get 'category_budgets/index'

  resources :casais, path_names: { new: 'cadastrar', edit: 'alterar' }
  resources :absolute_data, path: 'dados-absolutos', path_names: { new: 'cadastrar', edit: 'alterar' }

  get   '/pdsis/show', to: 'pdsis#show'

  scope '/dotacao-orcamentaria' do
    get '/',                  to: 'category_budgets#index',       as: :category_budgets
    get '/alterar/:id',       to: 'pdsis#edit_category_budgets',  as: :edit_category_budget, defaults: { section: 'dotacao_orcamentaria' }
  end

  scope '/meu-pdsi' do
    get '/:id/alterar/projecao-orcamentaria/:subsection',                   defaults: { section: 'projecao-orcamentaria' }, to: 'pdsis#edit',         as: :edit_budget_projection
    get '/:id/alterar/resultados-esperados/:subsection',                    defaults: { section: 'resultados-esperados', tab: 'resultados' },         to: 'pdsis#edit',  as: :edit_results
    get '/:id/alterar/resultados-esperados/responsabilidades/:subsection',  defaults: { section: 'resultados-esperados', tab: 'responsabilidades' },  to: 'pdsis#edit',  as: :edit_responsabilities
    get   '/(ver/:section)',                    to: 'pdsis#index',  as: :pdsis
    patch '/:id/alterar/:section',              to: 'pdsis#update', as: :pdsi
    get   '/:id/alterar/:section(/:base_polo)', to: 'pdsis#edit',   as: :edit_pdsi

    scope '/dados-demograficos' do
      patch '/:id/alterar',  to: 'demographic_datas#update',  as: :demographic_data
      get   '/:id/alterar',  to: 'demographic_datas#edit',    as: :edit_demographic_data
    end

    scope '/indicadores-saude-indigena', defaults: { section: 'indicadores-saude-indigena' }  do
      get '/:id/:subsection/alterar(/polo-base/:base_polo)(/casai/:casai)', to: 'pdsis#health_indicators', as: :health_indicators
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

  # ApplicationController Routes
  get '/health',            to: 'application#health'
  post  '/selecionar-dsei', to: 'application#set_dsei_and_pdsi_to_sesai', as: :set_dsei_and_pdsi_to_sesai

  root 'users#home'
end
