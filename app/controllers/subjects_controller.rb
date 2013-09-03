class SubjectsController < ApplicationController

	def index
		@subjects = Subject.order('subjects.position ASC')
	end

	def show
		@subject = Subject.find(params[:id])
	end

end
