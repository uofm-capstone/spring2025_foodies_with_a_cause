class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]



  def index
    @users = User.all
    render :index
  end

  def show
    # Show action to display the user profile
    render :show
  end

  def edit
    # Edit action to display the profile edit form
    render :edit
  end

  def update
    # Update action to handle the form submission
    if @user.update(user_params)
      puts "Updated lat: #{@user.latitude}, lng:#{@user.longitude}"
      redirect_to @user, notice: 'Profile updated successfully!'
    else
      puts @user.errors.full_message
      flash.now[:error] = 'There was an issue updating your profile.'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # Permit the profile_message and other attributes for updating
    params.require(:user).permit(
      :full_name,
      :phone_number,
      :location,
      :profile_message,
      :organization_type,
      :contact_preference,
      :summary_email_time,
      :instant_email,
      :summary_email)
  end
end
