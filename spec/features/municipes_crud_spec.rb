require 'rails_helper'

RSpec.describe 'Municipes CRUD', type: :feature do
  describe 'create' do
    let(:address_params) { build(:address) }
    let(:municipe_params) { build(:municipe) }

    context 'with required fields' do
      scenario 'creates a new municipe' do
        expect do
          visit municipes_path

          click_link 'Adicionar'
          expect(current_path).to eq(new_municipe_path)

          fill_in 'municipe_name', with: municipe_params.name
          fill_in 'municipe_email', with: municipe_params.email
          fill_in 'municipe_cpf', with: municipe_params.cpf
          fill_in 'municipe_cns', with: municipe_params.cns
          fill_in 'municipe_birth_date_string', with: municipe_params.birth_date_string
          fill_in 'municipe_phone', with: municipe_params.phone

          fill_in 'municipe_address_attributes_street', with: address_params.street
          fill_in 'municipe_address_attributes_number', with: address_params.number
          fill_in 'municipe_address_attributes_complement', with: address_params.complement
          fill_in 'municipe_address_attributes_neighborhood', with: address_params.neighborhood
          fill_in 'municipe_address_attributes_city', with: address_params.city
          fill_in 'municipe_address_attributes_state', with: address_params.state
          fill_in 'municipe_address_attributes_zip_code', with: address_params.zip_code
          fill_in 'municipe_address_attributes_ibge_code', with: address_params.ibge_code

          click_button 'Salvar'
          # puts page.body

          expect(page).to have_text('Munícipe criado com sucesso.')
        end.to change { Municipe.count }.by(1)

        expect(Municipe.order(:created_at).last.email).to eq(municipe_params.email)
      end
    end
  end


  describe 'update' do
    let!(:municipe) { create(:municipe) }
    let(:municipe_params) { build(:municipe) }

    scenario 'with valid input' do
      visit municipes_path

      find("a[href='#{edit_municipe_path(municipe)}']").click

      fill_in 'municipe_name', with: municipe_params.name
      fill_in 'municipe_email', with: municipe_params.email
      fill_in 'municipe_cpf', with: municipe_params.cpf
      fill_in 'municipe_cns', with: municipe_params.cns
      fill_in 'municipe_birth_date_string', with: municipe_params.birth_date_string
      fill_in 'municipe_phone', with: municipe_params.phone

      click_button 'Salvar'

      expect(page).to have_text('Munícipe atualizado com sucesso.')

      municipe = Municipe.order(:created_at).last

      expect(municipe).to eq(municipe_params.name)
      expect(municipe).to eq(municipe_params.email)
      expect(municipe).to eq(municipe_params.cpf)
      expect(municipe).to eq(municipe_params.cns)
      expect(municipe).to eq(municipe_params.phone)
    end

    scenario 'with invalid input' do
      visit municipes_path

      find("a[href='#{edit_municipe_path(municipe)}']").click

      fill_in 'municipe_name', with: ''
      fill_in 'municipe_email', with: ''
      fill_in 'municipe_cpf', with: ''
      fill_in 'municipe_cns', with: ''
      fill_in 'municipe_birth_date_string', with: ''
      fill_in 'municipe_phone', with: ''

      click_button 'Salvar'

      expect(page).to have_text('Erro ao atualizar o Munícipe.')
    end
  end
end
