class ReagentUse < ApplicationRecord
  belongs_to :reagent
  belongs_to :user
  belongs_to :lab

  validates :unit, :quantity, :date, presence: true



  def enough

      self.reagent.update(:quantity => (self.reagent.quantity) - (self.quantity))

      if self.reagent.quantity < self.reagent.trigger
        "This reagent needs to be ordered."
        #byebug

        UserMailer.with(user: self.user, reagent: self.reagent, lab: self.reagent.lab).trigger_email.deliver_now
      else
        "Thanks for registering your reagent use!"
      end
  end

  #def reagent_name
  #  Reagent.find(reagent_id).name
#  end



  scope :search_by_reagent_id, -> (reagent_id){where reagent_id: reagent_id }
  scope :search_by_user_id, -> (user_id){where user_id: user_id }

end
