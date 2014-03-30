class SessionsController < ApplicationController




  def destroy
    @session.destroy
    redirect_to new_user_session_path
  end
end
