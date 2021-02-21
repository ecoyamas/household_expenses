class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :title
      t.integer :price
      t.date :using_date

      t.timestamps
    end
  end
end
