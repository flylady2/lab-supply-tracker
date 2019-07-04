class ReagentUse < ApplicationRecord
  belongs_to :Reagent
  belongs_to :User
end
