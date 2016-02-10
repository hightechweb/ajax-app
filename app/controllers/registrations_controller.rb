class RegistrationsController < Devise::RegistrationsController

  def show
    # @user = User.find(params[:id])
    # @user = User.first DEVISE BELOW
    @user = current_user
  end

	def sign_up_params
		params.require(:user).permit(:name, :email, :password)
	end

	def account_update_params
		params.require(:user).permit(:name, :email, :password, :current_password)
	end

end
