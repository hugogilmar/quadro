class CreateQuadroAssets < ActiveRecord::Migration
  def change
    create_table :quadro_assets do |t|
      t.references :assetable, polymorphic: true
      t.string :type
      t.text :settings
      t.attachment :attachment
      t.timestamp :deleted_at
      t.timestamps
    end

    add_index :quadro_assets, [:assetable_id, :assetable_type]
    add_index :quadro_assets, :type
    add_index :quadro_assets, :deleted_at
  end
end
