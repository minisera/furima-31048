class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :source
  belongs_to_active_hash :day

  belongs_to :user
  bas_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :comment
    validates :price
    validates :status_id
    validates :category_id
    validates :source_id
    validates :charge_id
    validates :day_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :category_id
    validates :charge_id
    validates :source_id
    validates :day_id
  end

  validates :price, inclusion: { in: 300..9_999_999, message: 'Include ¥300-¥9.999.999 numbers' }, format: { with: /\A[0-9]+\z/ }
end
