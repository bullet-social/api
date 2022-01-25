class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.string :public, index: true
      t.string :secret
      t.integer :user_id, index: true
      t.boolean :master

      t.timestamps
    end
  end
end
