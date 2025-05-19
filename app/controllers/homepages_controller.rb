class HomepagesController < ApplicationController
  def index
    user = User.find(Current.session.user.id)
    @todolists = user.todolists
  end
end
