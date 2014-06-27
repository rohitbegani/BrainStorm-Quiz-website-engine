BrainStorm::Application.routes.draw do


   devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

   resources :levels,   :only => [:create, :show, :update, :destroy]
   resources :attempts, :only => [:create]
   
   root :to => "home_page#index"
   match '/home',           :to => 'home_page#index',         :as => 'home' 
   match '/admin',          :to => 'extra_pages#admin',       :as => 'admin' 
   match '/play',           :to => 'levels#play',             :as => 'play'
   match '/leaderboard',    :to => 'extra_pages#leaderboard', :as => 'leaderboard'
   match 'levels/:id/edit', :to => 'extra_pages#edit_level',  :as => 'edit_level'
   match '/rules',          :to => 'extra_pages#rules',       :as => 'rules'
   match 'team',            :to => 'extra_pages#team',       :as => 'team'
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
