class SessionsController < Devise::SessionsController
  def new
    # redirect_to(:controller => "/login", :action => "index")
    super 
  end

end
