class Post < ApplicationRecord  
    validates :title, length:  { maximum: 80 } , presence: true 
    validates  :body, length:  { minimum: 500 }, presence: true 
    validates  :priority, :date, presence: true    
  end