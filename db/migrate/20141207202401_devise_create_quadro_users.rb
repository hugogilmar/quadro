class DeviseCreateQuadroUsers < ActiveRecord::Migration
  def change
    create_table(:quadro_users) do |t|
      t.string :email
      t.string :name
      t.string :slug
      t.string :encrypted_password
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.integer  :failed_attempts, default: 0
      t.string   :unlock_token
      t.datetime :locked_at
      t.timestamp :deleted_at
      t.timestamps
    end

    add_index :quadro_users, :email, unique: true
    add_index :quadro_users, :reset_password_token, unique: true
    add_index :quadro_users, :unlock_token, unique: true
    add_index :quadro_users, :slug, unique: true
  end
end
