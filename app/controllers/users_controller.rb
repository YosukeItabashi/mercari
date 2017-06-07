class UsersController < ApplicationController

  def index
    if user_signed_in?
      redirect_to items_path
    end
  end

  def show
  end

end
