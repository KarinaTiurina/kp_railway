class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  before_action :set_ticket, only: [:show, :edit, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = @user

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to tickets_path, notice: 'Tickets was successfully created.' }
        format.json { render :index, status: :ok, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:way_id, :user_id, :price, :end_stop)
    end

    def set_current_user
      @user = current_user
    end
end
