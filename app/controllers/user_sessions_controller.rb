class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new(session)
  end

  def create
    @user_session = UserSession.new(session, params[:user_session])
    if @user_session.authenticate!
      redirect_to root_path, notice:  t('flash.notice.signed_in')
    else
      render :new
    end
  end

  def destroy
    #ainda nao
  end

end