class CreateCurrency < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.float :rate

      t.timestamps
    end
  end
end
