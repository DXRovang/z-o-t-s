class User < ApplicationRecord
  has_many :instruments
  has_many :categories, through: :instruments
  has_many :makers, through: :instruments
  has_many :families, through: :instruments
end
