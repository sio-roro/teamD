class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @already=Already.new
  end

  def add
    @user = User.find(params[:id])
    user = current_user
    user.increment(:point,1)
    user.save
    redirect_to :action => "show"
  end

  def set
    user=current_user
    if user.update(user_params)
      flash[:notice] = 'You sat your Love!!'
      redirect_to :action => "show", :id => user.id
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def anser
    @user=User.find(params[:id])
    if Already.exists?(user_id:params[:id],player_id:current_user.id)
      flash[:notice] = "You already have this menter's point"
      redirect_to :action => "show", :id => @user.id
    else
      @already=Already.new(already_params)
      @already.user_id=params[:id]
      @already.player_id=current_user.id
      cu_user=current_user
      if @already.ans==@user.love
        flash[:notice] = '正解！！ you got +1pt!'
        cu_user.increment(:point,1)
        cu_user.save
        @already.save
        redirect_to :action => "show", :id => @user.id
      else
        flash[:notice] = '不正解！！'
        render "show"
      end
    end
  end

  def mypage
    @user = current_user
    @cards = @user.posts
  end

  def user_params
    params.require(:user).permit(:love)
  end

  def already_params
    params.require(:already).permit(:ans)
  end

end
