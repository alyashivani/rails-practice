class Admin::UsersController < AdminsController
	def index
		@users = User.all
	end

	def edit
    @edituser = User.find(params[:id])
  end

  def update
    @edituser = User.find(params[:id])

    if @edituser.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @edituser = User.find(params[:id])
    @edituser.destroy

    redirect_to admin_users_path
  end

  def approval
    
  	@approve = User.where(id: params[:user_id]).update(approve: params[:approve])

    
    redirect_to admin_dashboards_path
  end
  
  
	private
	def user_params
		params.require(:user).permit(:name, :email, :phoneNumber, :dateBirth, :gender, :admin)
	end
end