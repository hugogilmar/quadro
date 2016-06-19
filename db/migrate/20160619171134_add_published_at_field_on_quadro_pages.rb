class AddPublishedAtFieldOnQuadroPages < ActiveRecord::Migration
  def change
    add_column :quadro_pages, :published_at, :timestamp
  end
end
