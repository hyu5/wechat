Rails.application.routes.draw do

  get 'posts/show'

  get '/home/list_friends'

  get 'posts/delete'

  post 'posts/delete'

  get 'posts/new'

  post 'posts/create'

  get 'posts/index'

  devise_for :admins
  get 'home/admin'

  devise_for :users
  get 'home/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'home/edit_profile' => 'home#edit_profile'
  get 'home/admin_edit_profile' => 'home#admin_edit_profile'
  get 'home/create_group' => 'home#create_group'
  get 'home/join_group' => 'home#join_group'

  get 'home/send_message' => 'home#send_message'

  post 'home/create_group' => 'home#create_group'
  post 'home/join_group' => 'home#join_group'

  post 'home/send_message' => 'home#send_message'

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: 'home#index'

  resources :home
  resources :friendships

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
