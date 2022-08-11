Rails.application.routes.draw do  

  root "posts#welcam"  
  resources :posts 
  get 'posts/index' 
   
end
