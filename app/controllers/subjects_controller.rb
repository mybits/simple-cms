class SubjectsController < ApplicationController

	def index
		@subjects = Subject.order('subjects.position ASC')
	end

	def show
		@subject = Subject.find(params[:id])
	end

	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.new      # (params[:subject]) - PROBLEM - nie wchodzą parametry
		if @subject.save
			flash[:notice] = "Subject created."
			redirect_to action: 'index'
		else
			render action: 'new'
		end
	end

	def edit
		@subject = Subject.find(params[:id])
	end

	def update
		@subject = Subject.find(params[:id])
		if @subject.update_columns(params[:subject])
			flash[:notice] = "Subject updated."
			redirect_to action: 'show'
		else
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

end
