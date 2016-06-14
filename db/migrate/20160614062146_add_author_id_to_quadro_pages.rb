class AddAuthorIdToQuadroPages < ActiveRecord::Migration
  def change
    add_column :quadro_pages, :author_id, :integer

    add_index :quadro_pages, :author_id
  end
end
