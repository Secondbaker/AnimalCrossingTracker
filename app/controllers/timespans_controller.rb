class TimespansController < ApplicationController
  before_action :set_timespan, only: [:show, :edit, :update, :destroy]

  # GET /timespans
  # GET /timespans.json
  def index
    @timespans = Timespan.all
  end

  # GET /timespans/1
  # GET /timespans/1.json
  def show
  end

  # GET /timespans/new
  def new
    @timespan = Timespan.new
  end

  # GET /timespans/1/edit
  def edit
  end

  # POST /timespans
  # POST /timespans.json
  def create
    @timespan = Timespan.new(timespan_params)

    respond_to do |format|
      if @timespan.save
        format.html { redirect_to @timespan, notice: 'Timespan was successfully created.' }
        format.json { render :show, status: :created, location: @timespan }
      else
        format.html { render :new }
        format.json { render json: @timespan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timespans/1
  # PATCH/PUT /timespans/1.json
  def update
    respond_to do |format|
      if @timespan.update(timespan_params)
        format.html { redirect_to @timespan, notice: 'Timespan was successfully updated.' }
        format.json { render :show, status: :ok, location: @timespan }
      else
        format.html { render :edit }
        format.json { render json: @timespan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timespans/1
  # DELETE /timespans/1.json
  def destroy
    @timespan.destroy
    respond_to do |format|
      format.html { redirect_to timespans_url, notice: 'Timespan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timespan
      @timespan = Timespan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timespan_params
      params.require(:timespan).permit(:start, :end)
    end
end
