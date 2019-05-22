class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :amount
      t.references :account, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
