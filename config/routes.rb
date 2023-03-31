Rails.application.routes.draw do
  get 'chatbot/index'
  resources :language_flashcards
  resources :flashcards
  resources :lessons
  resources :languages
  resources :users
  
   #user
   post "/signup", to: "users#create"
   get "/me", to: "users#me"
   post "/login", to: "sessions#create"
   delete "/logout", to: "sessions#destroy"
   get "/profile", to: "users#me"

  #  content

   get "/learning", to: "languages#languages"

  # continued content
   get "/uncompleted/:id", to: "flashcards#uncompleted"

  # next flashcards
   get "/next/:id", to: "flashcards#next"

  # chatbot
   post "/chat", to: "chatbot#create"

end
