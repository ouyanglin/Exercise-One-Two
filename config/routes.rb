ETwoOne::Application.routes.draw do
  match '/learn-more' => 'pages#learn'
  match '/make-a-suggestion' => 'pages#suggestion'

  root :to => 'pages#splash'
end
