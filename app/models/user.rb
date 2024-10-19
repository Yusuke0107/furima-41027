class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: { message: "can't be blank" }

  validates :password,
            format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)\z/,
                      message: 'is invalid. Include both letters and numbers' }

  validates :first_name, presence: { message: "can't be blank" },
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }

  validates :last_name, presence: { message: "can't be blank" },
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }

  validates :first_name_kana, presence: { message: "can't be blank" },
                              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }

  validates :last_name_kana, presence: { message: "can't be blank" },
                             format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }

  validates :birth_date, presence: { message: "can't be blank" }
end
