class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.string :title, null: false
      t.integer :salary, null: false
      t.date :salary_date, null: false

      t.timestamps
    end
  end
end
