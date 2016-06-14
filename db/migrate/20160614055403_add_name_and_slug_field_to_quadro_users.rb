class AddNameAndSlugFieldToQuadroUsers < ActiveRecord::Migration
  def change
    add_column :quadro_users, :name, :string
    add_column :quadro_users, :slug, :string

    add_index :quadro_users, :slug, unique: true
  end
end
