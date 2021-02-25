class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "Last name Full-width characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "First name Full-width characters"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters"}
    validates :birthday
  end
  # validates :email, uniqueness: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i, message: "Include both letters and numbers"}
end
