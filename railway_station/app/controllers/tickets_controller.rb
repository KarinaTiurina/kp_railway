class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  before_action :set_way, only: [:create, :destroy]
  before_action :set_ticket, only: [:destroy]

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  def create
    @new_ticket = @way.tickets.build(ticket_params)
    @new_ticket.user = @user
    @new_ticket.price = 100  # change to count method!!!

    respond_to do |format|
      if @new_ticket.save
        format.html { redirect_to way_path(@way), notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :ok, location: @way }
      else
        format.html { render 'ways/show', alert: "Ticket creation error." }
        format.json { render json: @new_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to way_url(@way), notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = @way.tickets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:price, :end_stop)
    end

    def set_way
      @way = Way.find(params[:way_id])
    end

    def set_current_user
      @user = current_user
    end
end
