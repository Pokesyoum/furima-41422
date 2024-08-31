class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must include both letters and numbers' }, if: lambda {
                                                                                                                                          password.present?
                                                                                                                                        }
  validates :last_name,  presence: true
  validates :last_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'must be in full-width characters (Kanji, Hiragana, Katakana)' }, if: lambda {
                                                                                                                                               last_name.present?
                                                                                                                                             }
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'must be in full-width characters (Kanji, Hiragana, Katakana)' }, if: lambda {
                                                                                                                                               first_name.present?
                                                                                                                                             }
  validates :last_kana,  presence: true
  validates :last_kana,
            format: { with: /\A[ァ-ヶー]+\z/, message: 'must be in full-width characters (Katakana)' }, if: -> { last_kana.present? }
  validates :first_kana, presence: true
  validates :first_kana,
            format: { with: /\A[ァ-ヶー]+\z/, message: 'must be in full-width characters (Katakana)' }, if: lambda {
                                                                                                           first_name.present?
                                                                                                         }
  validates :birthday, presence: true
end
