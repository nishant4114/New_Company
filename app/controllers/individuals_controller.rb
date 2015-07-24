class IndividualsController < ApplicationController
  before_filter :require_no_individual, :only => [:new, :create]
  before_filter :require_individual, :only => [:show, :edit, :update]


 def new
   @individual = Individual.new
 end

 def create
  @individual = Individual.new(individual_params)
 end

  private

  def individual_params
    params.require(:individual).permit(:email, :password, :password_confirmation, :is_active, :id)
  end


end
