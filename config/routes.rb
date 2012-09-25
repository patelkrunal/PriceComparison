PriceComparison::Application.routes.draw do
 

  match '/dataentry', to: 'admin_pages#dataentry'
  match 'admin_pages/fetch_link', to: 'admin_pages#fetch_link'
  match '/admin_pages/dfill', to:'admin_pages#dfill'
  match 'admin_pages/Seller', to: 'admin_pages#Seller'
  match 'admin_pages/cronJob', to: 'admin_pages#cronJob'
  match 'admin_pages/updateprice', to: 'admin_pages#updateprice'
  
  match 'client_pages/result', to: 'client_pages#result'
  match 'client_pages/home', to: 'client_pages#home'
  match 'client_pages/autocomplete', to: 'client_pages#autocomplete'
  match 'client_pages/data', to: 'client_pages#data'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
