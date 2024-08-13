class TurboController < ApplicationController
  def logout
    sign_out(current_employee)
    redirect_to new_employee_session_path, notice: 'You have been signed out.'
  end
end
