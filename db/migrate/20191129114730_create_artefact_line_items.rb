class CreateArtefactLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :artefact_line_items do |t|
      t.string :sageone_guid, limit: 32
      t.string :name, limit: 255
      t.decimal :quantity
      t.decimal :net_amount
      t.references :artefact

      t.timestamps
    end
    add_index :artefact_line_items, :sageone_guid
  end
end
