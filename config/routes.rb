Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {sessions: "user/sessions"}
  
  root to: "home#index"

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :orders do
          resources :order_items
        end
      end
      resources :products do
        resources :product_variants
        resources :feedbacks
      end
      resources :sports do 
        resources :tickets
      end
      resources :variants

    end 
  end

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

  resources :sports do
    resources :tickets
  end

  

end
