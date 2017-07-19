Rails.application.routes.draw do
  post 'auth_user' => 'authentication#authenticate_user'

  devise_for :users

  root to: 'destinations#index'

  resources :destinations do
    collection do
      get :most_reviews
      get :search
    end
    resources :reviews
  end

end
