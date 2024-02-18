class Municipe < ApplicationRecord
  stringify :birth_date, format: '%d/%m/%Y'

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :cns, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :birth_date, presence: true
  validates :cns, '::CnsBrazil::Cns': true
  # validates :email, email: true
  # validates :cpf, cpf: true

  has_one :address, dependent: :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :address
end
