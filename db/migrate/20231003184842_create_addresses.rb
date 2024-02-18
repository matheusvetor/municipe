# 2.1 Campos: `CEP, Logradouro, complemento, bairro, cidade, UF e codigo IBGE`;

# 2.2 Todos os dados são obrigatórios, exceto complemento e código IBGE;

# 2.3 Em termos de MVC, existe apenas a Entidade relacional endereço. O restante é dispensável;

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code, null: false, default: ''
      t.string :street, null: false, default: ''
      t.string :number, null: false, default: ''
      t.string :complement, null: false, default: ''
      t.string :neighborhood, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :state, null: false, default: ''
      t.string :ibge_code, null: false, default: ''
      t.belongs_to :municipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
