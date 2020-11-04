class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
  validates :nickname, presence: true
  validates :family_name,presence: true
  validates :first_name,presence: true
  validates :family_name_kana,presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :first_name_kana,presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :birth_day,presence:true

  has_many :items
end