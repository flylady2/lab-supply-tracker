class ReagentUse < ApplicationRecord
  belongs_to :reagent
  belongs_to :user

  def enough
    if self.quantity > self.reagent.quantity
      "Sorry. There is not enough of this reagent for your experiment."
    else
      self.reagent.update(
        :quantity => self.reagent.quantity - self.quantity
      )
      "Thanks for registering your reagent use!"
    end
  end
end
