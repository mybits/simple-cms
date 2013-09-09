class SectionsController < ApplicationController

	layout 'admin'
	
	def index
		@sections = Section.all
	end

	def show
		@section = Section.find(params[:id])
	end

	def new
		@section = Section.new
		@section_count = Section.count + 1
		# @page_id_count = Page.find_by_id(params[:id])
	end

	def create
		@section = Section.new(section_params)
		if @section.save
			flash[:notice] = 'Section created.'
			redirect_to action: 'index'
		else
			@section_count = Section.count + 1
			# @page_id_count = Page.find_by_id(params[:id])
			render action 'new'
		end
	end

	def edit
		@section = Section.find(params[:id])
		@section_count = Section.count
	end

	def update
		@section = Section.find(params[:id])
		if @section.update_columns(params[:section])
			flash[:notice] = 'Section updated.'
			redirect_to action: 'show'
		else
			@section_count = Section.count
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
