class Goal < ApplicationRecord
  belongs_to :user

  def total_income
    # incomes.reduce(:+)
    100
  end
end
