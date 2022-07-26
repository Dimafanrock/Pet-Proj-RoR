class Post < ApplicationRecord  
    validates  :title, length:  { maximum: 80, message: 'to long'} , 
                presence: true , 
                format: { with: /\A[\w\s!#$%&'*+-\/=?^_`{|}~\.]+\z/, 
                message: 'only allows letters and digits' }

    validates  :body, length:  { maximum: 500 },
                presence: true 
                
    validates  :priority, presence: true 

    date_check = Date.new(2100, 1, 1)

    validates  :date,  comparison: { greater_than: Date.today,  less_than: date_check }

  end