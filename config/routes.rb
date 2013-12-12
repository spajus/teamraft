Teamraft::Application.routes.draw do

  resources :attribute_types

  devise_for :people

  resource :company, controller: 'company' do
  end

  get '/people/tags_list.js' => 'people#tags_list', as: :people_tags_list


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
