Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "user/sessions"}
  
  root to: "home#index"

  namespace :admin do
    resources :dashboards, only: :index
    resources :products do
      collection do 
        get :options_for_variant
      end  
    end
    resources :users
    resources :orders
    resources :variants

    resources :product_variant
    
    resources :orders do
      collection do
        post :update_status
      end
    end
    
    resources :users do
      collection do
        post :approval
      end
    end
  end



  resources :home do
    collection do
      get :dashboard
      post :add_to_cart
    end
  end


  
  resources :carts
  
  resources :carts do 
    collection do
      post :update_qty
    end
  end

  resources :orders do 
    collection do
      post :order_placed
      get :yourOrder
    end
  end

  resources :products do
    resources :feedbacks
  end

  # resources :products do
  #   resources :feedbacks
  # end
  

end
