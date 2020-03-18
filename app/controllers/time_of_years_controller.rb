class TimeOfYearsController < ApplicationController
  before_action :set_time_of_year, only: [:show, :edit, :update, :destroy]

  # GET /time_of_years
  # GET /time_of_years.json
  def index
    @time_of_years = TimeOfYear.all
  end

  # GET /time_of_years/1
  # GET /time_of_years/1.json
  def show
  end

  # GET /time_of_years/new
  def new
    @time_of_year = TimeOfYear.new
  end

  # GET /time_of_years/1/edit
  def edit
  end

  # POST /time_of_years
  # POST /time_of_years.json
  def create
    @time_of_year = TimeOfYear.new(time_of_year_params)

    respond_to do |format|
      if @time_of_year.save
        format.html { redirect_to @time_of_year, notice: 'Time of year was successfully created.' }
        format.json { render :show, status: :created, location: @time_of_year }
      else
        format.html { render :new }
        format.json { render json: @time_of_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_of_years/1
  # PATCH/PUT /time_of_years/1.json
  def update
    respond_to do |format|
      if @time_of_year.update(time_of_year_params)
        format.html { redirect_to @time_of_year, notice: 'Time of year was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_of_year }
      else
        format.html { render :edit }
        format.json { render json: @time_of_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_of_years/1
  # DELETE /time_of_years/1.json
  def destroy
    @time_of_year.destroy
    respond_to do |format|
      format.html { redirect_to time_of_years_url, notice: 'Time of year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_of_year
      @time_of_year = TimeOfYear.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_of_year_params
      params.require(:time_of_year).permit(:start, :end)
    end
end
