class ApplicationController < ActionController::Base
  include Pagy::Backend
  helper_method :turbo_native_app?
  helper_method :turbo_native_ios?
  before_action :authenticate_employee!

  private

  def turbo_native_ios?
    request.user_agent.include?("Turbo Native iOS")
  end

end
