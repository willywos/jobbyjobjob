class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:settings, :update_settings]

  def settings
  end

  def update_settings
    respond_to do |format|
      if @user.update(user_params)
        bypass_sign_in(@user)
        format.html { redirect_to user_settings_path, notice: 'Update Successful!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :zip, :phone_number, :website, :password, :password_confirmation)
  end
end
