class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal,:city,:address,:prefecture_id,:building,:phone,:token

  with_options presence:true do
    validates :postal
    validates :city
    validates :prefecture_id
    validates :address
    validates :phone
   end

   def save
    item = Item.find(pramas[:id])
    order = Order.create(token: token,user_id: current_user.id,item_id: item.id)

    Address.create(postal: postal,city: city,address: address,building: building,prefecture_id: prefecture_id,phone: phone,order_id: order.id)
   end
    
end