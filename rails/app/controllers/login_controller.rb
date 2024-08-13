class LoginController < ApplicationController 
  skip_before_action :authenticate_employee!, only: [:index]
  def index
    @employee = Employee.new
  end
end
