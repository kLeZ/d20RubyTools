class RpgTemplatesController < ApplicationController
	before_action :authenticate_user!
	def index
		@rpg_templates = RpgTemplate.all
	end

	def show
		@rpg_template = RpgTemplate.find(params[:id])
	end

	def new
	end

	def create
		render json: params
	end

	def edit
	end

	def destroy
	end
end
