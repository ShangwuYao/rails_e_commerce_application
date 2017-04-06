class ProfilesController < ApplicationController
    def new
        # form where a user can fill out there own profile
        @user = User.find(params[:user_id])
        @profile = @user.build_profile
    end
    
    
    def create
        @user = User.find(params[:user_id])
        @profile = @user.build_profile(profile_params)
    end
    
    private profile_params
    def profile_params
        params.require(:profile).permit(:first_name,:last_name, :job_title, :phone_number, :contact_email, :description)
    end
    
end
