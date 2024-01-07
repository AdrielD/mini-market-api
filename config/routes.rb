Rails.application.routes.draw do
  root to: 'api/api#health_check'

  get 'api', to: 'api/api#health_check'
  get 'api/v1', to: 'api/api#health_check'

  namespace :api do
    get 'health_check' => 'api#health_check'

    namespace :v1 do
      resources :products, except: [:new]
      resources :categories, except: [:new]
    end

    get 'api/v1', :to => redirect('/api/health_check')
  end
end
