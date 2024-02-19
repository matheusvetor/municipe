class Municipe < ApplicationRecord
  stringify :birth_date, format: '%d/%m/%Y'

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true
  validates :cns, presence: true, uniqueness: { case_sensitive: false }
  validates :phone, presence: true
  validates :birth_date, presence: true
  validates :cns, '::CnsBrazil::Cns': true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :cpf_validator
  validate :birth_validator

  has_one :address, dependent: :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :address

  private

  def cpf_validator
    errors.add(:cpf, t('invalid')) unless CPF.valid?(cpf)
  end

  def birth_validator
    errors.add(:birth_date, t('invalid')) if birth_date.blank? || birth_date > Date.today
  end
end
