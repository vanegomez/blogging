Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :show, :create, :new, :update] do
    collection do
      get :drafts
    end

    resources :comments, only: [:create, :destroy]
  end
end
