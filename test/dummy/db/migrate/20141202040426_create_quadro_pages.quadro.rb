# This migration comes from quadro (originally 20141129022344)
class CreateQuadroPages < ActiveRecord::Migration
  def change
    create_table :quadro_pages do |t|
      t.string :title, length: 24
      t.string :slug, length: 24
      t.string :ancestry, length: 24
      t.integer :ancestry_depth, default: 0
      t.text :settings
      t.timestamp :deleted_at
      t.timestamps
    end

    add_index :quadro_pages, :slug, unique: true
    add_index :quadro_pages, :ancestry
    add_index :quadro_pages, :deleted_at
  end
end
