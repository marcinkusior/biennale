Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  filter :locale

  get 'votes/create'
  resources :newsaddresses, only: [:create]
  get 'registrations/fetch_images', to: 'registrations#fetch_images'
  get 'archives/fetch_records'
  get 'archives/fetch_contest_records'
  get 'archives/fetch_record_images'
  get 'galleries/fetch_records'
  get 'galleries/fetch_record'
  post 'votes/create'

  get '/inactive' => 'pages#inactive'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/instruction' => 'pages#instruction'

  namespace :admin do
    root 'generals#settings'

    get 'registrations_delete_all' => 'registrations#delete_all'
    get 'registration_conferences_delete_all' => 'registration_conferences#delete_all'
    get 'registrations/archive'
    get 'registration_conferences/archive'
    resources :partner_categories
    resources :administrators
    resources :images
    resources :registrations
    resources :registration_conferences
    resources :events
    resources :partners
    resources :paragraphs
    resources :pages
    resources :markers
    resources :generals
    resources :contest_archives
    resources :records
    resources :archives
    resources :votes
    resources :public_images
    resources :contest_records
    resources :newsaddresses
    resources :attachments

    get 'results' =>'votes#results'
    get 'votes_delete_all' => 'votes#delete_all'
    post 'update_order' => "public_images#update_order"
    post 'update_contest_record_order' => "contest_records#update_order"
    post 'update_partners_order' => "partners#update_order"
    post 'update_partner_categories_order' => "partner_categories#update_order"
    post 'update_contest_archive_order' => "contest_archives#update_order"
    post 'update_archive_order' => "archives#update_order"

    get 'email_contest' => "emails#contest"
    get 'email_conference' => "emails#conference"
    get 'email_send_contest' => "emails#send_contest"
    get 'email_send_contest_pl' => "emails#send_contest_pl"
    get 'email_send_conference' => "emails#send_conference"
    get 'email_send_conference_pl' => "emails#send_conference_pl"
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
end
