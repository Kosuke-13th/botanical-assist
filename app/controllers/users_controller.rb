class UsersController < ApplicationController

  def show
    @plants = current_user.plants
  end

end
