Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :merchants, only:[:index, :show] do
        get '/:id/revenue', on: :collection, to: "merchants/revenues#show"
        get '/find', on: :collection, to: "merchants/searches#show"
        get '/find_all', on: :collection, to: "merchants/searches#index"
      end
    end
  end
end
