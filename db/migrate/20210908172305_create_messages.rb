class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :recipient
      t.string :message_id

      t.timestamps
    end
  end
end
