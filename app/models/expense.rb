class Expense < ApplicationRecord
  belongs_to :account
  belongs_to :category
  validate :check_time

  def check_limit?
    category.limit_exceded?
  end
  private

  def check_time
    if date > Date.today
      errors.add(:date, "cannot be after today.")
    end
  end
end
