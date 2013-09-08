class SectionsController < ApplicationController

	def index
		@sections = Section.all
	end

	def show
		@section = Section.find(params[:id])
	end

	def new
		@section = Section.new
	end

	def create
		@section = Section.new(section_params)
		if @section.save
			flash[:notice] = 'Section created.'
			redirect_to action: 'index'
		else
			render action 'new'
		end
	end

	def edit
		@section = Section.find(params[:id])
	end

	def update
		@section = Section.find(params[:id])
		if @section.update_columns(params[:section])
			flash[:notice] = 'Section updated.'
			redirect_to action: 'show'
		else
			render action: 'edit'
		end
	end

	def delete
		@section = Section.find(params[:id])
	end

	def destroy
		Section.find(params[:id]).destroy
		flash[:notice] = 'Section deleted.'
		redirect_to action: 'index'
	end


	private

		def section_params
			params.require(:section).permit(:name, :position, :visible, :content)
		end


end
