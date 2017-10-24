class CreateFeedBacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feed_backs do |t|
      t.integer :rate
      t.text :comment
      t.references :user, foreign_key: true
      t.references :breed, foreign_key: true

      t.timestamps
    end
  end
end
