Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :books, only: [:index, :destroy]
=======
  resources :books, only: [:index, :destroy, :create, :new]
>>>>>>> c48afca641f6aa246524919367f78f2d48df2b03
end
