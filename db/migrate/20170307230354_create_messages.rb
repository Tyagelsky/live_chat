class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user, index: true
      t.belongs_to :room, index: true
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :messages, [:user_id, :created_at]
  end
end
