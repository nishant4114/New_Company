class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper :all
  helper_method :current_individual_session, :current_individual

  private
  def current_individual_session
    return @current_individual_session if defined?(@current_individual_session)
    @current_individual_session = IndividualSession.find
  end

  def current_individual
    return @current_individual if defined?(@current_individual)
    @current_individual = current_individual_session && current_individual_session.record
  end

  def require_individual
    unless current_individual
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_individual_session_url
      return false
    end
  end

  def require_no_individual
    if current_individual
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
end
