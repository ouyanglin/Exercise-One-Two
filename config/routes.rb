ETwoOne::Application.routes.draw do
  resources :accounts, :only => [:create, :update, :show]

  match '/learn-more' => 'pages#learn'
  match '/make-a-suggestion' => 'pages#suggestion'

  root :to => 'pages#splash'
end
