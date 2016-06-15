class CreateQuadroPages < ActiveRecord::Migration
  def change
    create_table :quadro_pages do |t|
      t.references :author
      t.string :title
      t.string :slug
      t.string :summary
      t.string :ancestry
      t.integer :ancestry_depth, default: 0
      t.text :settings
      t.timestamp :deleted_at
      t.timestamps
    end

    add_index :quadro_pages, :slug, unique: true
    add_index :quadro_pages, :ancestry
    add_index :quadro_pages, :deleted_at
    add_index :quadro_pages, :author_id
  end
end
