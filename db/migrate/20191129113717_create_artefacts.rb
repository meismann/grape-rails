class CreateArtefacts < ActiveRecord::Migration[5.2]
  def change
    create_table :artefacts do |t|
      t.string :sageone_guid, limit: 32
      t.date :date
      t.string :reference
      t.decimal :total
      t.boolean :issued
      t.references :contact
      t.references :main_address
      t.references :delivery_address

      t.timestamps
    end
    add_index :artefacts, :sageone_guid
  end
end
