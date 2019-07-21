class ReagentUse < ApplicationRecord
  belongs_to :reagent
  belongs_to :user
  belongs_to :lab

  validates :unit, :quantity, :date, presence: true

  def enough

      self.reagent.update(:quantity => (self.reagent.quantity) - (self.quantity))
      #byebug
      "Thanks for registering your reagent use!"

  end
end
