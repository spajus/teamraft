Teamraft::Application.routes.draw do

  get "feedback/index", as: :feedback
  post "feedback/index"

  get "privacy" => 'static#privacy', as: :privacy
  get "terms" => 'static#terms', as: :terms

  mount RailsAdmin::Engine => '/ninja', :as => 'rails_admin'
  resources :attribute_types do
    put :up
    put :down
  end

  devise_for :people

  resource :company, controller: 'company' do
  end

  get '/people/tags_list.js' => 'people#tags_list', as: :people_tags_list
  get '/people/edit' => 'people#bulk_edit', as: :people_bulk_edit
  post '/people/edit' => 'people#bulk_update'

  match '/me' => 'people#me', as: :me, via: [:get, :post]

  resources :people do
  end

  get '/tag/:tag_name' => 'tags#show', as: :tag

  resource :register, controller: 'register', only: [] do
    match :company, via: [:get, :post]
    match :person, via: [:get, :post]
    match 'for/:company_name/:reg_code' => 'register#himself', via: [:get, :post], as: 'himself'
  end

  root 'welcome#index'

end
