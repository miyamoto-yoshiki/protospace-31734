class PrototypesController < ApplicationController
  before_action :move_to_session, except: [:index, :show]
  #before_action :authenticate_user!, except: [:index, :show]
  before_action :edit_access, only:[:edit]

  def index
    @prototypes = Prototype.all #Prototypeテーブルの全てのレコードを渡す
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params) #何を新しく保存するか指定
    @prototype.user_id = current_user.id #誰が投稿したかを指定     #キータから参照
    if @prototype.save #もし保存ができたら
      redirect_to root_path
    else #できなければ
      render :new
    end
  end

  def show

    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.save 
      redirect_to prototype_path
    else 
      @prototype = Prototype.find(params[:id])
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    if prototype.destroy 
      redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def edit_access
    @prototype = Prototype.find(params[:id])
    unless  current_user.id == @prototype.user_id
      redirect_to root_path
    end
  end
end
