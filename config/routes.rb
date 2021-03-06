Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'auth'    =>  'home#auth'
  
  # Get login token from Knock
  post  '/user_token'  => 'user_token#create'
  
  #User actions
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'
  
  #Customer actions
  get   '/customers'                            => 'customers#index'
  get   '/customers/find/:firstname'            => 'customers#find'
  post  '/customers/create'                     => 'customers#create'
  put   '/customers/:id'                        => 'customers#update'
  delete '/customers/:id'                       => 'customers#destroy'
  
  #Zip codes actions
  get '/zip_codes'                              => 'zip_codes#index'
  get '/zip_codes/find/:zip_code'               => 'zip_codes#find'
  
  
end
