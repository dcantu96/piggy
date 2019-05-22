class Income < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :goal, optional: true
  validate :only_one_account

  private
  
  def only_one_account
    if account.present?
      if goal.present?
        errors.add(:goal, "cannot exist if account exists.")
      end
    elsif goal.present?
      if account.present?
        errors.add(:account, "cannot exist if goal exists.")
      end
    end
  end
end
