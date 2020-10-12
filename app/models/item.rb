class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status

  validates :user_id,:name,:comment,:price,:status_id,:category_id,:source_id,:charge_id,:day_id, presence: true

  validates :status_id, numericality: {other_than: 1}
end
