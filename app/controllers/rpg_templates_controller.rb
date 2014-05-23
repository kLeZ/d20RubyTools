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
	end

	def edit
	end

	def destroy
	end

	def room_params
		params.require(:rpg_template).permit(:name)
	end
end
