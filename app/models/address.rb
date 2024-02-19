class Address < ApplicationRecord
  belongs_to :municipe

  validates :zip_code, presence: true
  validates :street, presence: true
  validates :number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def to_s
    "#{street}, #{number}, #{neighborhood}, #{city} - #{state} - #{zip_code}"
  end
end
