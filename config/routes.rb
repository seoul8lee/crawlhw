Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'haksicks#index'
  get '/get_bob' => 'haksicks#get_bob'
end
