class UsersController < ApplicationController
  before_action :move_to_session, except: [:index, :show]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @prototypes = Prototype.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :position, :occupation, :profile)
  end
  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
