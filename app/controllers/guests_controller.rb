class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

    before_filter :load_event

   def index
    @guests = @event.guests.all
    @unchecked = Guest.where(checked: false)
    @checked = Guest.where(checked: true)
  end

  def show
    @guest = @event.guests.find(params[:id])
  end

  def new
    @guest = @event.guests.new
  end

  def edit
    @guest = @event.guests.find(params[:id])
  end


  def create
    @guest = @event.guests.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to [@event,@guest], notice: 'Guest was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

   def update

   @guest = @event.guests.find(params[:id])
     
    respond_to do |format|
      if @guest.update_attributes(guest_params)
        format.html { redirect_to [@event, @guest], notice: 'Guest was successfully updated.' }
        else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @guest = @event.guests.find(params[:id])
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to event_guests_path(@event), notice: "Guest was successfully removed." }
    end
  end

  def checked   
  
    @guest = @event.guests.find(params[:id])
      if @guest.checked == false
    @guest.update_attribute(:checked, true)
        redirect_to event_guests_path, notice: "#{@guest.guest_name} was successfully checked."
    else 
    @guest.update_attribute(:checked, false)
        redirect_to event_guests_path, notice: "#{@guest.guest_name} was successfully unchecked."
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:guest_name, :guest_email, :event_id)
    end

    def  load_event
      @event = Event.find(params[:event_id]) 
    end 
end
