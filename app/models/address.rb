class Address < ApplicationRecord
  belongs_to :order

  with_options presence:true do
    validates :order
    validates :postal
    validates :city
    validates :prefecture_id
    validates :address
    validates :phone
   end
end
