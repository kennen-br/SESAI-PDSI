Rails.application.routes.draw do
  resources :sesai_people,
            path: 'pessoas-sesai',
            path_names: { new: 'cadastrar', edit: 'alterar', destroy: 'excluir' }

  resources :people,
            path: 'pessoas',
            path_names: { new: 'cadastrar', edit: 'alterar', destroy: 'excluir' }

  resources :budget_correction_factors
  resources :costs

  post '/image-upload',     to: 'application#image_upload', as: :image_upload
  post '/procurar-pessoa',  to: 'people#search',            as: :search

  get 'category_budgets/index'

  resources :results, path: 'resultados', path_names: { new: 'cadastrar', edit: 'alterar' }
  resources :casais, path_names: { new: 'cadastrar', edit: 'alterar' }
  resources :absolute_data, path: 'dados-absolutos', path_names: { new: 'cadastrar', edit: 'alterar' }

  get '/pdsis/show', to: 'pdsis#show'

  scope '/dotacao-orcamentaria' do
    get '/', to: 'category_budgets#index', as: :category_budgets
    get '/alterar/:id',
        to: 'pdsis#edit_category_budgets',
        as: :edit_category_budget, defaults: { section: 'dotacao_orcamentaria' }
  end

  scope '/meu-pdsi' do
    post '/:id/alterar/projecao-orcamentaria/new_budget_forecast_by_cost',
         to: 'pdsis#new_budget_forecast_by_cost',
         as: :new_budget_forecast_by_cost

    post '/:id/alterar/projecao-orcamentaria/novo-comentario',
         to: 'budget_forecasts#new_comment',
         as: :budget_forecast_new_comment

    post '/:id/alterar/projecao-orcamentaria/ver-comentario',
         to: 'budget_forecasts#see_comment',
         as: :budget_forecast_see_comment

    post '/:id/alterar/projecao-orcamentaria/update_cost_name',
         to: 'pdsis#update_cost_name',
         as: :update_cost_name

    get '/:id/alterar/projecao-orcamentaria/:subsection',
        defaults: { section: 'projecao-orcamentaria' },
        to: 'pdsis#edit',
        as: :edit_budget_projection

    get '/:id/alterar/resultados-esperados/:subsection',
        defaults: { section: 'resultados-esperados', tab: 'resultados' },
        to: 'pdsis#edit',
        as: :edit_results

    get '/:id/alterar/resultados-esperados/responsabilidades/:subsection',
        defaults: { section: 'resultados-esperados', tab: 'responsabilidades' },
        to: 'pdsis#edit',
        as: :edit_responsabilities

    get '/(ver/:section)',                    to: 'pdsis#index',      as: :pdsis
    patch '/:id/alterar/:section',            to: 'pdsis#update',     as: :pdsi
    get '/:id/alterar/:section(/:base_polo)', to: 'pdsis#edit',       as: :edit_pdsi
    delete '/:id/mapa/excluir',               to: 'pdsis#delete_map', as: :delete_map

    get '/:id/alterar/anexos/dimensionamento-necessidades/:subsection',
        defaults: { section: 'anexos' },
        to: 'pdsis#edit',
        as: :edit_anexos

    scope '/dados-demograficos' do
      patch '/:id/alterar', to: 'demographic_datas#update', as: :demographic_data
      get '/:id/alterar', to: 'demographic_datas#edit', as: :edit_demographic_data
    end

    scope '/indicadores-saude-indigena', defaults: { section: 'indicadores-saude-indigena' } do
      get '/:id/:subsection/alterar(/polo-base/:base_polo)(/casai/:casai)',
          to: 'pdsis#health_indicators',
          as: :health_indicators
    end

    # Resultados Esperados
    get '/:id/resultados-esperados',
        to: 'results_special#index', as: :results_special

    post '/:id/resultados-esperados',
         to: 'results_special#update', as: :results_special_edit

    post '/:id/resultados-esperados/loop',
         to: 'results_special#loop', as: :results_special_loop

    post '/:id/resultados-esperados/respontabilidade',
         to: 'results_special#responsability', as: :results_special_responsability

    post '/:id/resultados-esperados/nao-se-aplica',
         to: 'results_special#false_result', as: :results_special_false_result

    post '/:id/resultados-esperados/novo-comentario',
         to: 'results_special#new_comment', as: :results_special_new_comment

    post '/:id/resultados-esperados/delete',
         to: 'results_special#delete', as: :results_special_delete

    post '/:id/resultados-esperados/associar-produto',
         to: 'results_special#link_product', as: :results_special_link_product

    post '/:id/resultados-esperados/associar-produto-dsei',
         to: 'results_special#link_product_dsei', as: :results_special_link_product_dsei

    post '/:id/resultados-esperados/resultado-especifico',
         to: 'results_special#specific_result', as: :results_special_specific_result

    post '/:id/resultados-esperados/resultado-especifico/atualizar',
         to: 'results_special#specific_update', as: :results_special_specific_update

    post '/:id/resultados-esperados/resultado-especifico/deletar',
         to: 'results_special#delete_specific_result', as: :results_special_delete_specific_result

    post '/:id/resultados-esperados/ordenar-produtos',
         to: 'results_special#products_order', as: :results_special_products_order

    post '/:id/resultados-esperados/ver-comentario',
         to: 'results_special#see_comment', as: :results_special_see_comment

    # Resultados Específicos
    get '/:id/resultados-especificos',
        defaults: { section: 'resultados-esperados', tab: 'especificos' },
        to: 'specific_results#edit',
        as: :edit_specific_results

    patch '/:id/resultados-especificos',
          defaults: { section: 'resultados-esperados', tab: 'especificos' },
          to: 'specific_results#update',
          as: :update_specific_results
  end

  scope '/templates' do
    get '/',                        to: 'text_templates#index',   as: :text_templates
    patch '/:id/alterar/:section',  to: 'text_templates#update',  as: :text_template
    get '/:id/alterar/:section',    to: 'text_templates#edit',    as: :edit_text_template
    get '/introducao-sesai',        to: 'text_templates#introducao_sesai', as: :introducao_sesai
    get '/analise-situacional-sesai', to: 'text_templates#analise_situacional_sesai', as: :analise_situacional_sesai
    get '/processo-de-construcao-sesai', to: 'text_templates#processo_de_construcao_sesai', as: :processo_de_construcao_sesai
  end

  devise_for :users, path: '', path_names: { sign_in: 'entrar',
                                             sign_out: 'sair',
                                             password: 'secret',
                                             confirmation: 'verification',
                                             unlock: 'unblock',
                                             registration: 'register',
                                             sign_up: 'cmon_let_me_in' }

  resources :users, path: 'usuarios', path_names: { new: 'cadastrar', edit: 'alterar' }

  get '/alterar-senha',   to: 'users#edit_password',    as: :edit_password
  patch '/alterar-senha', to: 'users#update_password',  as: :update_password

  # ApplicationController Routes
  get '/health', to: 'application#health'
  post '/selecionar-dsei',
       to: 'application#set_dsei_and_pdsi_to_sesai',
       as: :set_dsei_and_pdsi_to_sesai

  scope '/locations' do
    get '/villages', to: 'locations#villages'
    get '/cities', to: 'locations#cities'
  end

  root 'users#home'
end
