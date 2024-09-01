class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must include both letters and numbers' }
  validates :last_name,  presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be in full-width characters (Kanji, Hiragana, Katakana)' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be in full-width characters (Kanji, Hiragana, Katakana)' }
  validates :last_kana,  presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'must be in full-width characters (Katakana)' }
  validates :first_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'must be in full-width characters (Katakana)' }
  validates :birthday,   presence: true
end
