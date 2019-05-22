class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :name
      t.float :amount
      t.datetime :date
      t.references :account, foreign_key: true
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
