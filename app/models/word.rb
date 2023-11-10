# app/models/word.rb
class Word < ApplicationRecord
  has_many :comments, dependent: :destroy
end