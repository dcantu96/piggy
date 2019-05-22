class Account < ApplicationRecord
  belongs_to :user
  has_many :incomes
  has_many :expenses

  def balance
    total_incomes - total_expenses
  end

  def total_incomes
    return incomes.map{|column| column[:amount]}.reduce(:+) if incomes.present?
    0
  end

  def total_expenses
    return expenses.map{|column| column[:amount]}.reduce(:+) if expenses.present?
    0
  end

  def records
    (incomes+expenses).flatten.sort_by { |record| record.date }.reverse
  end

  def most_recent_records
    records.first(5)
  end
end
