class Instrument < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :maker
  belongs_to :family

  validates_presence_of :price, :year, :maker_name

end
