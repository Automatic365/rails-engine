Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :merchants, only:[:index, :show] do
        get ':id/revenue', on: :collection, to: "merchants/revenues#show"
        get 'find', on: :collection, to: "merchants/searches#show"
        get 'find_all', on: :collection, to: "merchants/searches#index"
        get 'random', on: :collection, to: "merchants/random#show"
      end

      resources :invoices, only: [:index, :show] do
        get 'find', on: :collection, to: "invoices/search#show"
        get 'find_all', on: :collection, to: "invoices/search#index"
      end
      resources :items, only: [:index, :show] do
        get 'find', on: :collection, to: "items/search#show"
        get 'find_all', on: :collection, to: "items/search#index"
      end
      resources :invoice_items, only: [:index, :show] do
        get 'find', on: :collection, to: "invoice_items/search#show"
        get 'find_all', on: :collection, to: "invoice_items/search#index"
      end
    end
  end
end
