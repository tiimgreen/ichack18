class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def search
  end
end
