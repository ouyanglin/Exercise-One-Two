ETwoOne::Application.routes.draw do
  resources :accounts, :only => [:create, :update, :show]

  match '/learn-more' => 'pages#learn', :as => 'learn'
  match '/make-a-suggestion' => 'pages#suggestion', :as => 'suggestion'

  root :to => 'pages#splash'
end
