class RegistersController < ApplicationController
  allow_unauthenticated_access

  def new
    render layout: "session"
  end

  def create
  end

  def destroy
  end
end
