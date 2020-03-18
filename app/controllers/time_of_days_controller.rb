class TimeOfDaysController < ApplicationController
  before_action :set_time_of_day, only: [:show, :edit, :update, :destroy]

  # GET /time_of_days
  # GET /time_of_days.json
  def index
    @time_of_days = TimeOfDay.all
  end

  # GET /time_of_days/1
  # GET /time_of_days/1.json
  def show
  end

  # GET /time_of_days/new
  def new
    @time_of_day = TimeOfDay.new
  end

  # GET /time_of_days/1/edit
  def edit
  end

  # POST /time_of_days
  # POST /time_of_days.json
  def create
    @time_of_day = TimeOfDay.new(time_of_day_params)

    respond_to do |format|
      if @time_of_day.save
        format.html { redirect_to @time_of_day, notice: 'Time of day was successfully created.' }
        format.json { render :show, status: :created, location: @time_of_day }
      else
        format.html { render :new }
        format.json { render json: @time_of_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_of_days/1
  # PATCH/PUT /time_of_days/1.json
  def update
    respond_to do |format|
      if @time_of_day.update(time_of_day_params)
        format.html { redirect_to @time_of_day, notice: 'Time of day was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_of_day }
      else
        format.html { render :edit }
        format.json { render json: @time_of_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_of_days/1
  # DELETE /time_of_days/1.json
  def destroy
    @time_of_day.destroy
    respond_to do |format|
      format.html { redirect_to time_of_days_url, notice: 'Time of day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_of_day
      @time_of_day = TimeOfDay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_of_day_params
      params.require(:time_of_day).permit(:collectible_id, :start, :end)
    end
end
