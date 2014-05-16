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
				m.save
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
		m = Member.find_by(user: current_user, room: @room)
		m.is_online = false
		m.save

		@room.save

		redirect_to rooms_path
	end

	def list_members
		@room = Room.find(params[:id])
		respond_to do |format|
			format.html { render :members_list, :layout => false }
			format.xml  { render xml: @room.members }
			format.json { render json: @room.members }
		end
	end

	private

	def room_params
		params.require(:room).permit(:name)
	end
end
