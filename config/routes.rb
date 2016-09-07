Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api do
     namespace :v1 do
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
       
       resources :merchants do
         get '/:id/revenue', to: "revenues#show", as: "revenue"
       end       
     end
  end
end
