Rails.application.routes.draw do
    # devise_for :users ,controllers: { omniauth_callbacks: 'users/omniauth' }
    devise_for :users ,controllers: { omniauth_callbacks: 'omniauth' }

  resources :capsules do
  resources :items
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'welcome/index'
  # root to: 'welcome#index'




  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
 
  get 'capsules/index'
  root 'capsules#index' 

  #re-route sessions destroy 
devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
   
  # get 'users/show'
  # root 'users#show' 


   
  

 end
