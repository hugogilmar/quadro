class CreateQuadroWidgets < ActiveRecord::Migration
  def change
    create_table :quadro_widgets do |t|
      t.references :page
      t.string :type
      t.string :name
      t.text :content
      t.text :settings
      t.timestamp :deleted_at
      t.timestamps
    end

    add_index :quadro_widgets, [:page_id, :name], unique: true
    add_index :quadro_widgets, :name
    add_index :quadro_widgets, :page_id
    add_index :quadro_widgets, :type
    add_index :quadro_widgets, :deleted_at
  end
end
