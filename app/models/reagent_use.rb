class ReagentUse < ApplicationRecord
  belongs_to :reagent
  belongs_to :user
  belongs_to :lab

  validates :unit, :quantity, :date, :user_id, :lab_id, :reagent_id, presence: true



  def enough
      self.reagent.update(:quantity => (self.reagent.quantity) - (self.quantity))
      if self.reagent.quantity < self.reagent.trigger
        AdminMailer.with(user: self.user, reagent: self.reagent, lab: self.reagent.lab).trigger_email.deliver_now
      end
  end

  def self.search_by_date(start_date, end_date)
    ReagentUse.where( "date BETWEEN ? and ? ", start_date, end_date)
  end


  scope :search_by_reagent_id, -> (reagent_id){where reagent_id: reagent_id }
  scope :search_by_user_id, -> (user_id){where user_id: user_id }



end
