class ChatBoxController < ApplicationController
	before_action :authenticate_user!

	def create
		@room = Room.find(params[:room_id])

		if not params[:message][:body].to_s.strip.empty?
			evaluator = MainEvaluator.new
			body = evaluator.evaluate(params[:message][:body])
			message = Message.new(:body => body, :user => current_user, :room => @room)
			@room.messages << message

			@room.save
		else
			flash[:alert] = "You cannot specify a blank text! Write something into the message board!"
		end

		redirect_to room_path(@room)
	end

	def index
		@room = Room.find(params[:room_id])
		respond_to do |format|
			format.html { render :layout => false } # index.html.erb
			format.xml  { render xml: @room.messages }
			format.json { render json: @room.messages }
		end
	end

	def clear
		@room = Room.find(params[:room_id])
		@room.messages.delete_all
		redirect_to room_path(@room)
	end
end
