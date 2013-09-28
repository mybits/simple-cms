class SubjectsController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	
	def index
		@subjects = Subject.order('subjects.position ASC')
	end

	def show
		@subject = Subject.find(params[:id])
	end

	def new
		@subject = Subject.new
		@subject_count = Subject.count + 1
	end

	def create
		@subject = Subject.new(subject_params)
		if @subject.save
			flash[:notice] = "Subject created."
			redirect_to action: 'index'
		else
			@subject_count = Subject.count + 1
			render action: 'new'
		end
	end

	def edit
		@subject = Subject.find(params[:id])
		@subject_count = Subject.count
	end

	def update
		@subject = Subject.find(params[:id])
		if @subject.update_columns(params[:subject])
			flash[:notice] = "Subject updated."
			redirect_to action: 'show'
		else
			@subject_count = Subject.count
			render action: 'edit'
		end
	end

	def delete
		@subject = Subject.find(params[:id])
	end

	def destroy
		Subject.find(params[:id]).destroy
		flash[:notice] = "Subject destroyed."
		redirect_to action: 'index'
	end

	private

	def subject_params
		params.require(:subject).permit(:name, :position, :visible)
	end

end
