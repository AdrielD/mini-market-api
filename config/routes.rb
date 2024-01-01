Rails.application.routes.draw do
  namespace :api do
    get 'health_check' => 'api#health_check'

    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update]
      resources :categories, only: [:index, :show, :create, :update]
    end
  end
end
