require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { build(:address) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:cep) }
    it { is_expected.to validate_presence_of(:line1) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:municipe) }
  end
end
