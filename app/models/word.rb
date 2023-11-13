# app/models/word.rb

class Word < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image  # 画像用のフィールドを追加
  validates :term, presence: true
end
