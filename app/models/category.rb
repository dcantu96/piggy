class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses

  def limit_exceded?
    weekly_expenses = expenses.where(date: Date.today-7.days..Date.today).map{|column| column[:amount]}.reduce(:+) if expenses.present?
    weekly_expenses = 0 if weekly_expenses.nil?
    weekly_expenses > limit
  end
end
