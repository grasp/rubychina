Ruser::Engine.routes.draw do
    root :to => "users#routenav"

      devise_for :users, :path => "account", :class_name=>'Ruser::User',:controllers => {       
       module: :devise,
       :registrations => "ruser/account",
       :sessions=>"ruser/rsessions",
      :omniauth_callbacks => "ruser/user/omniauth_callbacks",
      
    } do
    get "account/update_private_token" => "account#update_private_token", :as => :update_private_token_account

  end
  
  match "account/auth/:provider/unbind", :to => "users#auth_unbind"

  match "users/location/:id", :to => "users#location", :as => :location_users
  
      resources :users 
       
#  resources :users do
 #   member do
 #     get :topics
 #     get :likes
 #   end
  #end
  
end
