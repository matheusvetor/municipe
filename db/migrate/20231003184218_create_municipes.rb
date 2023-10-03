# 1.1 Dados do munícipe: `Nome completo, CPF, CNS(cartão nacional de saúde), Email, Data nascimento, Telefone (código do pais e ddd), Foto e status`.
# 
# 1.2 Todos os dados do munícipe são obrigatórios;
# 
# 1.3 `CPF, CNS,Email` devem ser válidos;
# 
# 1.4 Tenha atenção a data de nascimento. Valide os casos impossíveis/improváveis de serem válidos;
# 
# 1.5 Foto do munícipe deve ser tamanhos diferentes para servir vários casos.

class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :name, null: false, default: ''
      t.string :cpf, null: false, default: '', unique: true
      t.string :cns, null: false, default: '', unique: true
      t.string :email, null: false, default: '', unique: true
      t.date :birth_date
      t.string :phone, null: false, default: ''
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
