class Order < ApplicationRecord
 belongs_to :item
 belongs_to :user
 has_one :address

 with_options presence:true do
  validates :user
  validates :item
 end
   
 end
end
