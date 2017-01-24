class UsersController < ApplicationController

before_action :authenticate_user!

  def index
  end
  def new
  end
  def create
      puts "CHECK HERE", params.inspect
  end

  def show
    @user =User.find(params[:id])

  end

  def edit

  end

  def updated
  end

  def destroy
  end
end
