class AdminUsersController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in

	def index
		@admin_users = AdminUser.all
	end

	def new
		@admin_user = AdminUser.new
	end

	def create
		@admin_user = AdminUser.new(admin_user_params)
		if @admin_user.save
			flash[:notice] = "Admin user created."
			redirect_to action: 'index'
		else
			render action: 'new'
		end
	end

	def edit
		@admin_user = AdminUser.find(params[:id])
	end

	def update
		@admin_user = AdminUser.find(params[:id])
		if @admin_user.update_columns(admin_user_params)
			flash[:notice] = "Admin user updated"
			redirect_to action: 'index'
		else
			render action: 'edit'
		end
	end

	def delete
		@admin_user = AdminUser.find(params[:id])
	end

	def destroy
		AdminUser.find(params[:id]).destroy
		flash[:notice] = 'Admin user deleted.'
		redirect_to action: 'index'
	end

	private

	def admin_user_params
		params.require(:admin_user).permit(:first_name, :last_name, :email, :username)
	end

end
