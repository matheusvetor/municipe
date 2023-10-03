class Address < ApplicationRecord
  validates :cep, presence: true
  validates :line1, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true

  belongs_to :municipe
end
