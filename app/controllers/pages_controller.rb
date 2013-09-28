class PagesController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	
	def index
		@pages = Page.all
	end

	def show
		@page = Page.find(params[:id])
	end

	def new
		@page = Page.new
		@page_count = Page.count + 1
	end

	def create
		@page = Page.new(page_params)
		if @page.save
			flash[:notice] = "Page successfully created."
			redirect_to action: 'index'
		else
			@page_count = Page.count + 1
			render action: 'new'
		end
	end

	def edit
		@page = Page.find(params[:id])
		@page_count = Page.count
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_columns(params[:page])
			flash[:notice] = "Page successfully updated."
			redirect_to action: 'show'
		else
			@page_count = Page.count + 1
			render action: 'new'
		end
	end

	def delete
		@page = Page.find(params[:id])
	end

	def destroy
		Page.find(params[:id]).destroy
		flash[:notice] = "Page deleted."
		redirect_to action: 'index'
	end

	private

		def page_params
			params.require(:page).permit(:name, :permalink, :position, :visible)
		end
end
