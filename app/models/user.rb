class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,presence: true
  validates :email,   uniqueness: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_katakana
    validates :last_name_katakana
  end
  validates :password_confirmation, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX,message: 'には英字と数字の両方を含めて設定してください' },confirmation: true
  validates :birthday,presence: true

end
