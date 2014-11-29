class AddPageIdFieldOnWidgets < ActiveRecord::Migration
  def change
    add_column :quadro_widgets, :page_id, :integer

    add_index :quadro_widgets, :page_id
  end
end
