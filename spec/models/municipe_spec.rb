require 'rails_helper'

RSpec.describe Municipe, type: :model do
  let(:municipe) { build(:municipe) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:phone) }

    it { is_expected.to validate_uniqueness_of(:cpf) }
    it { is_expected.to validate_uniqueness_of(:cns) }
    it { is_expected.to validate_uniqueness_of(:email) }

    it { is_expected.to validate_cns }
  end

  context 'associations' do
    it { is_expected.to have_one(:address).dependent(:destroy) }
  end
end
