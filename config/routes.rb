Rails.application.routes.draw do
  root 'welcome#index', as: 'home'
  get 'welcome/index'
  
   resources :articles do
    resources :comments
    collection do
      get :search #create new path for searching
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
