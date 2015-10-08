Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :show, :create, :new, :update] do
    collection do
      get :drafts
    end
  end
end
