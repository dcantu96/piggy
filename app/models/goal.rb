class Goal < ApplicationRecord
  belongs_to :user

  def investment
    # incomes.reduce(:+)
    100
  end
end
