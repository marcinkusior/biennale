Rails.application.routes.draw do
  get 'votes/create'

  namespace :admin do
    get 'results' =>'votes#results'
    get 'votes_delete_all' => 'votes#delete_all'
    resources :votes
  end
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  namespace :admin do
    resources :public_images
  end
  namespace :admin do
    resources :contest_records
  end
  namespace :admin do
    resources :contest_archives
  end
  

  namespace :admin do
    resources :records
  end
  namespace :admin do
    resources :archives
  end
  filter :locale

  get 'newsaddresses/create'

  get 'registrations/fetch_images', to: 'registrations#fetch_images'
  get 'archives/fetch_records'
  get 'archives/fetch_contest_records'
  get 'archives/fetch_record_images'
  get 'galleries/fetch_records'
  get 'galleries/fetch_record'
  post 'votes/create'

  resources :newsaddresses, only: [:create]

  namespace :admin do
    get 'registrations_delete_all' => 'registrations#delete_all'
    get 'registration_conferences_delete_all' => 'registration_conferences#delete_all'
    get 'registrations/archive'
    get 'registration_conferences/archive'
    resources :administrators
    resources :images
    resources :registrations
    resources :registration_conferences
    resources :events
    resources :partners
    resources :paragraphs
    resources :pages
    resources :markers
    resources :newsaddresses
    resources :generals

    root 'generals#settings'
  end

  # mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", :locale => /en|pl/ do
    resources :registration_conferences, only: [ :new, :create]
    resources :registrations, only: [ :new, :create]
    
    PagesController.action_methods.each do |action|
      get "#{action}" => "pages##{action}"
    end
    root 'pages#Biennial'
  end
  get '/inactive' => 'pages#inactive'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
