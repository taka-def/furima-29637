class User < ApplicationRecord
  has_many :items
  has_many :purchases
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
   validates :nickname
   validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
   validates :birth_date
   validates :last_name, format: { with:/\A[ぁ-んァ-ン一-龥]/, message:"は全角で入力して下さい。"}
   validates :first_name, format: { with:/\A[ぁ-んァ-ン一-龥]/, message:"は全角で入力して下さい。"}
   validates :password, confirmation: true
   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end
end
