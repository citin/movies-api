Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies
      resources :seasons
      resources :movies_and_seasons
      resources :users do
        member do
          post 'purchase'
          get 'purchases'
        end
      end
    end
  end
end
