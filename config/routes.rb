Rails.application.routes.draw do
  namespace :api do
    get 'health_check' => 'api#health_check'

    namespace :v1 do
      resources :products, except: [:new]
      resources :categories, except: [:new]
    end
  end
end
