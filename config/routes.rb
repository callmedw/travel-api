Rails.application.routes.draw do
  root to: 'destinations#index'
  resources :destinations do
    collection do
      get :most_reviews
      get :search
    end
    resources :reviews
  end

end
