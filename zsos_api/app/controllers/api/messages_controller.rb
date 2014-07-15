
module Api
class MessagesController < ApplicationController
  
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all

    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @messages }
    # end
    render json: @messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    render json: @message
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    render json: @message
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end


  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    head :no_content
  end

  def find_nearby_devices
    nearby_devices = Array.new
    #current_message = Message.where(latitude: message_params[:latitude], longtitude: message_params[:longtitude])
    current_message = Message.find(params[:id])
    User.all.each do |user|
      if !user.messages.include? current_message 
        d = distance [current_message.latitude, current_message.longtitude], [user.latitude, user.longtitude]
        if d <= 5000
          nearby_devices << user
        end
      end
    end
    render json: nearby_devices
  end

  def message_params
  	params.require(:message).permit(:audio_url, :audio_length, :user_id, :longtitude, :latitude, :message)
  end

  private

  def distance(a, b)
    if !(a.nil? || b.nil?)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlon_rad = (b[1]-a[1]) * rad_per_deg  # Delta, converted to rad
    dlat_rad = (b[0]-a[0]) * rad_per_deg

    lat1_rad, lon1_rad = a.map! {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = b.map! {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math.asin(Math.sqrt(a))

    rm * c # Delta in meters
    end
  end

end

end