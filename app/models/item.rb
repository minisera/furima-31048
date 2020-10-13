class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status,:category,:charge,:source,:day
  belongs_to :user
  has_one_attached :image

  validates :user_id,:name,:comment,:price,:status_id,:category_id,:source_id,:charge_id,:day_id, presence: true

  validates :status_id, numericality: {other_than: 1}
  validates :category_id, numericality: {other_than: 1}
  validates :charge_id, numericality: {other_than: 1}
  validates :source_id, numericality: {other_than: 1}
  validates :day_id, numericality: {other_than: 1}

end
