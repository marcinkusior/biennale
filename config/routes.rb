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
    post 'update_order' => "public_images#update_order"
  end
  namespace :admin do
    resources :contest_records
    post 'update_contest_record_order' => "contest_records#update_order"
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
  get '/instruction' => 'pages#instruction'

end
