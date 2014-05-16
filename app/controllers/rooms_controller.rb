class RoomsController < ApplicationController
	before_action :authenticate_user!
	def index
		@rooms = Room.all
	end

	def create
		@room = Room.new(room_params)
		@room.master = current_user

		@room.save

		redirect_to rooms_path
	end

	def show
		@room = Room.find(params[:id])
		if not @room.members.select { |m| m.user.username == current_user.username }.any?
			member = Member.new(:user => current_user, :room => @room, :is_online => true)
			@room.members << member
		else
			@room.members.select { |m| m.user.username == current_user.username }.each do |m|
				m.is_online = true
			end
		end
		@room.save
	end

	def destroy
		@room = Room.find(params[:id])

		if @room.master.username == current_user.username
			@room.destroy
		else
			flash[:error] = "You cannot destroy this room. Only the master (#{@room.master.username}) can."
		end
		redirect_to rooms_path
	end

	def exit
		@room = Room.find(params[:id])
		Member.find_by(user: current_user, room: @room).is_online = false
		#@room.members.delete(Member.find_by(user: current_user, room: @room))

		@room.save

		redirect_to rooms_path
	end

	private
	def room_params
		params.require(:room).permit(:name)
	end
end
