class AddSummaryFieldOnQuadroPages < ActiveRecord::Migration
  def change
    add_column :quadro_pages, :summary, :string
  end
end
