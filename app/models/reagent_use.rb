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
        scope :search_by_name, -> (search_name){where('lower(name) like ?', "%#{search_name.downcase}%")}
        scope :search_by_reagent, -> (search_reagent){where('lower(reagent) like ?', "%#{search_reagent.downcase}%")}


  end





end
