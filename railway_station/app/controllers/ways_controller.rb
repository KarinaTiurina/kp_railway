class WaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  before_action :set_way, only: [:show, :edit, :update, :destroy]

  # GET /ways
  # GET /ways.json
  def index
    @ways = Way.all

    if params[:stop_filter].present?
      @ways = Way.where("'" + params[:stop_filter] + "' = ANY (stops_array)")
    end
  end

  # GET /ways/1
  # GET /ways/1.json
  def show
    @new_ticket = @way.tickets.build(params[:ticket])
  end

  def new
    @way = Way.new
    @trains = Train.all
    @cities = %w(Минск Гомель Гродно Могилев Пинск)
  end

  def create
    @way = Way.new(way_params)
    @way.stops_array = params[:stops_array]
    @way.stops_array.pop

    respond_to do |format|
      if @way.save
        format.html { redirect_to ways_path, notice: 'Маршрут успешно создан.' }
        format.json { render :index, status: :ok, location: @way }
      else
        format.html { render :new }
        format.json { render json: @way.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /ways/1/edit
  def edit
  end

  # PATCH/PUT /ways/1
  # PATCH/PUT /ways/1.json
  def update
    @way.stops_array = params[:stops_array]
    @way.stops_array.pop

    respond_to do |format|
      if @way.update(way_params)
        format.html { redirect_to ways_path, notice: 'Данные маршрута успешно обновлены.' }
        format.json { render :index, status: :ok, location: @way }
      else
        format.html { render :edit }
        format.json { render json: @way.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ways/1
  # DELETE /ways/1.json
  def destroy
    @way.destroy
    respond_to do |format|
      format.html { redirect_to ways_url, notice: 'Маршрут успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_way
      @way = Way.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def way_params
      params.require(:way).permit(:way_number, :stops_array, :train_id, :departure, :arrival)
    end

    def set_current_user
      @user = current_user
    end
end
