class CreateQuadroWidgets < ActiveRecord::Migration
  def change
    create_table :quadro_widgets do |t|
      t.string :name, length: 20, null: false
      t.references :widgetable, polymorphic: true
      t.timestamp :deleted_at
      t.timestamps
    end

    add_index :quadro_widgets, :name, unique: true
    add_index :quadro_widgets, [:widgetable_id, :widgetable_type]
    add_index :quadro_widgets, :deleted_at
  end
end
