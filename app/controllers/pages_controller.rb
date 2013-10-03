class PagesController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :find_subject
	
	def index
		@pages = Page.all.where(:subject_id => @subject.id)
	end

	def show
		@page = Page.find(params[:id])
	end

	def new
		@page = Page.new(:subject_id => @subject.id)
		@page_count = Page.count + 1
		@subjects = Subject.order('position ASC')
	end

	def create
		@page = Page.new(page_params)
		if @page.save
			flash[:notice] = "Page successfully created."
			redirect_to(action: 'index', :subject_id => @page.subject_id)
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
			redirect_to(action: 'show', :subject_id => @page.subject_id)
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
		redirect_to(action: 'index', :subject_id => @subject.id)
	end

	private

		def page_params
			params.require(:page).permit(:name, :permalink, :position, :visible)
		end

		def find_subject
			if params[:subject_id]
				@subject = Subject.find_by_id(params[:subject_id])
			end
		end
end
