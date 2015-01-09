module UsersHelper

  private

    def authenticate
      deny_access unless signed_in?
    end

    def already_signed_in
      deny_access_signed_in unless !signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end

    def correct_user_admin_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user) || current_user.admin?
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end

    def master_user
      redirect_to root_path unless current_user.master?
    end
end