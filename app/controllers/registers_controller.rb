class RegistersController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
    render layout: "session"
  end

  def create
    @user = User.new(create_user_params)
    if @user.save
      redirect_to new_session_path, notice: "Account registered succesfully, please login with your new account"
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :new, layout: "session", status: :unprocessable_entity
    end
  end

  private

  def create_user_params
    params.expect(user: [ :email_address, :password ])
  end
end
