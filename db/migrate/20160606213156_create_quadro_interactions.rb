class CreateQuadroInteractions < ActiveRecord::Migration
  def change
    create_table :quadro_interactions do |t|
      t.references :interactable, polymorphic: true
      t.text :content
      t.string :ip_address
      t.string :user_agent
      t.timestamps
    end
  end
end
