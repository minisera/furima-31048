class ItemOrder
  include ActiveModel::Model
  attr_accessor :token,:postal,:city,:address,:prefecture_id,:building,:phone,:user_id,:item_id

  with_options presence:true do
    validates :postal
    validates :city
    validates :prefecture_id
    validates :address
    validates :phone
    varidates :token
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal: postal,city: city,address: address,building: building,prefecture_id: prefecture_id,phone: phone,order_id: order.id)
  end
    
end