class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :review_id
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
