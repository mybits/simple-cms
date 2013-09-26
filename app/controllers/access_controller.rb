class AccessController < ApplicationController

	def index
		menu
		render 'menu'
	end

  def menu
  	# display text & links
  end

  def login
  	# login form
  end

  def attempt_login
  end

  def logout
  end


end
