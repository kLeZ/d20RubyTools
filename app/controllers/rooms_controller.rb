class RoomsController < ApplicationController
	before_action :authenticate_user!
	def index
		@rooms = Room.all
	end

	def create
		@room = Room.new(room_params)
		@room.master = current_user
		@room.members << Member.new(:user => current_user, :room => @room)

		@room.save

		redirect_to rooms_path
	end

	def show
		@room = Room.find(params[:id])
	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy

		redirect_to rooms_path
	end

	private
	def room_params
		params.require(:room).permit(:name)
	end
end
