class Instrument < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :maker
  belongs_to :family
end
