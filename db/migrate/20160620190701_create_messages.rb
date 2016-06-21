class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender_name
      t.string :receiver_name
      t.text :content

      t.timestamps null: false
    end
  end
end
