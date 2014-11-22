class CreateQuadroWidgets < ActiveRecord::Migration
  def change
    create_table :quadro_widgets do |t|
      t.references :widgetable, polymorphic: true
      t.string :type, length: 24, null: false
      t.string :name, length: 24, null: false
      t.text :content
      t.text :settings
      t.timestamp :deleted_at
      t.timestamps
    end

    add_index :quadro_widgets, :name, unique: true
    add_index :quadro_widgets, :type
    add_index :quadro_widgets, [:widgetable_id, :widgetable_type]
    add_index :quadro_widgets, :deleted_at
  end
end
