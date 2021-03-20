class PostController < ApplicationController
  def index
    @posts=Post.all  
    @gacha=nil
  end

  def gacha
    user=current_user
    user.decrement(:point,1)
    user.save
    @gacha=Post.where( 'id >= ?', rand(Post.first.id..Post.last.id) ).first
    @posts=Post.all
    @relation=CardRelation.new(user_id:current_user.id,card_id:@gacha.id)
    if @relation.save
      render "index"
    end  
  end
  
  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end 

  private
  def post_params
    params.require(:post).permit(:body, :image)
  end
end
