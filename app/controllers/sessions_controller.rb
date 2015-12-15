class SessionsController < ApplicationController
  def new
  end

  def create
    administrator = Administrator.find_by_email(params[:email])
    if administrator && administrator.authenticate(params[:password])

      session[:administrator_id] = administrator.id
      redirect_to admin_root_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:administrator_id] = nil
    redirect_to '/login'
  end
end
