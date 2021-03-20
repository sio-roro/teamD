class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def add
    @user = User.find(params[:id])
    user = current_user
    user.increment(:point,1)
    user.save
    redirect_to :action => "show"
  end

  def mypage
    @user = current_user
    @cards = @user.posts
  end
end
