module ReagentUsesHelper

  def sorter
    #byebug
    if params[:reagent] != ""
      reagent = @lab.reagents.search_by_name(params[:reagent]).first
      #byebug
      if reagent
        @reagent_uses = ReagentUse.search_by_reagent_id(reagent.id)
        #byebug
      else
        flash[:message] = "There are no reagent use records for that reagent."
        @reagent_uses = @lab.reagent_uses
      end

    elsif params[:consumer] != ""
      #byebug
      user = @lab.users.search_by_consumer_name(params[:consumer]).first
      #byebug
      if user
        #byebug
        @reagent_uses = ReagentUse.search_by_user_id(user.id)
      else
        flash[:message] = "There are no reagent use records for that user."
        @reagent_uses = @lab.reagent_uses
      end


    elsif params[:start_date] != "" && params[:end_date] != ""
      #byebug
      reagent_uses = @lab.reagent_uses.search_by_date(params[:start_date], params[:end_date])
      #byebug
      if reagent_uses == []

        flash[:message] = "There are no reagent use records for that time period."
        @reagent_uses = @lab.reagent_uses

      else
        @reagent_uses = reagent_uses
      end
    end

  end



end
