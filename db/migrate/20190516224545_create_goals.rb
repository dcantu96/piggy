class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.date :completion_date
      t.references :user, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
