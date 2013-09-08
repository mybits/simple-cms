class PagesController < ApplicationController

	layout 'admin'
	
	def index
		@pages = Page.all
	end

	def show
		@page = Page.find(params[:id])
	end

	def new
		@page = Page.new
	end

	def create
		@page = Page.new(page_params)
		if @page.save
			flash[:notice] = "Page successfully created."
			redirect_to action: 'index'
		else
			render action: 'new'
		end
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_columns(params[:page])
			flash[:notice] = "Page successfully updated."
			redirect_to action: 'show'
		else
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
