class Goal < ApplicationRecord
  belongs_to :user
  has_many :incomes, dependent: :destroy

  def investment
    return incomes.map{|column| column[:amount]}.reduce(:+) if incomes.present?
    0
  end
end
