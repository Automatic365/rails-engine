Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :merchants, only:[:index, :show] do
        get ':id/revenue', on: :collection, to: "merchants/revenues#show"
        get 'find', on: :collection, to: "merchants/searches#show"
        get 'find_all', on: :collection, to: "merchants/searches#index"
        get 'random', on: :collection, to: "merchants/random#show"
        get ':id/items', on: :collection, to: "merchants/merchant_items#index"
        get 'most_items', on: :collection, to: "merchants/merchant_items#show"
        get ':id/invoices', on: :collection, to: "merchants/merchant_invoices#index"
        get ':id/customers_with_pending_invoices', on: :collection, to: "merchants/pendings#index"
      end

      resources :transactions, only:[:index, :show] do
        get 'find', on: :collection, to: "transactions/searches#show"
        get 'find_all', on: :collection, to: "transactions/searches#index"
        get 'random', on: :collection, to: "transactions/random#show"
        get '/:id/invoice', on: :collection, to: "transactions/invoices#show"
      end

      resources :customers, only:[:index, :show] do
        get 'find', on: :collection, to: "customers/searches#show"
        get 'find_all', on: :collection, to: "customers/searches#index"
        get 'random', on: :collection, to: "customers/random#show"
          get '/:id/invoices', on: :collection, to: "customers/invoices#show"
          get '/:id/transactions', on: :collection, to: "customers/transactions#show"
      end

       resources :invoices, only: [:index, :show] do
         get 'find', on: :collection, to: "invoices/search#show"
         get 'find_all', on: :collection, to: "invoices/search#index"
         get 'random', on: :collection, to: "invoices/random#show"
         get '/:id/transactions', on: :collection, to: "invoices/transactions#show"
         get '/:id/invoice_items', on: :collection, to: "invoices/invoice_items#show"
         get '/:id/items', on: :collection, to: "invoices/items#show"
         get '/:id/customers', on: :collection, to: "invoices/customers#show"
         get '/:id/merchants', on: :collection, to: "invoices/merchants#show"
       end

       resources :items, only: [:index, :show] do
         get 'find', on: :collection, to: "items/search#show"
         get 'find_all', on: :collection, to: "items/search#index"
         get 'random', on: :collection, to: "items/random#show"
         get '/:id/invoice_items', on: :collection, to: "items/item_invoice_items#index"
         get '/:id/merchant', on: :collection, to: "items/items_merchant#index"
         get '/:id/best_day', on: :collection, to: "items/revenues#index"
       end

       resources :invoice_items, only: [:index, :show] do
         get 'find', on: :collection, to: "invoice_items/search#show"
         get 'find_all', on: :collection, to: "invoice_items/search#index"
         get 'random', on: :collection, to: "invoice_items/random#show"
         get '/:id/invoice', on: :collection, to: "invoice_items/invoice_items_invoice#index"
         get '/:id/item', on: :collection, to: "invoice_items/invoice_items_item#index"
       end
     end
  end
end
