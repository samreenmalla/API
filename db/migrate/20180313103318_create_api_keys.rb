class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.references :client, foreign_key: true
      t.string :name
      t.string :key

      t.timestamps
    end
  end
end
