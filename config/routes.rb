Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        post '/', to: 'registrations#create'
        post '/sign_in', to: 'sessions#create'
        patch '/refresh', to: 'sessions#update'
        delete 'sign_out', to: 'sessions#destroy'
      end

      resources :projects do
        resources :tasks, only: [:index, :create]
      end
      resources :tasks, only: [:show, :update, :destroy] do
        resources :comments, only: [:index, :create]
        patch '/complete', to: 'tasks#complete'
        patch '/position', to: 'tasks#position'
      end
      resources :comments, only: [:destroy]
    end
  end
end
