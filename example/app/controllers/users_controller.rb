class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created'
      redirect_to action: :new
    else
      flash.now[:error] = 'There was a problem'
      render :new
    end
  end

  def edit
    user_model = User.find(params[:id])
    @user = UserOutputForm.new(user_model)
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to action: :new
    else
      flash.now[:error] = 'Something went wrong'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :phone, :date_of_birth
    )
  end
end
