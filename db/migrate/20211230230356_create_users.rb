class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
			t.string :email
      t.string :username
      t.string :name
      t.string :bio
      t.string :password_digest
      t.string :password_reset_token
      t.boolean :verified, default: false
      t.integer :subscribers_count, default: 0
      t.integer :subscriptions_count, default: 0
      t.timestamps
    end
  end
end
