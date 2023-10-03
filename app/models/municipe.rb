class Municipe < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :cns, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :birth_date, presence: true

  has_one :address, dependent: :destroy
end
