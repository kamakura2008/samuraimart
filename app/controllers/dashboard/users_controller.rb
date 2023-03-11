class Dashboard::UsersController < ApplicationController
    before_action :authenticate_admin!
    layout "dashboard/dashboard"
    
    def index
        # @users = User.display_list(params[:pages])
        if params[:keyword].present?
            @keyword = params[:keyword].strip
            @users = User.search_information(@keyword).display_list(params[:pages])
        else
            @keyword = ""
            @users = User.display_list(params[:pages])
        end
    end
    
    def destroy
        user = User.find(params[:id])
        deleted_flag = User.switch_flg(user.deleted_flag)
        user.update(deleted_flag: deleted_flag)
        redirect_to dashboard_users_path
    end
end