class FishingSpotsController < ApplicationController
  before_action :set_fishing_spot, only: [:show, :edit, :update, :destroy]

  # GET /fishing_spots
  # GET /fishing_spots.json
  def index
    @fishing_spots = FishingSpot.all
  end

  # GET /fishing_spots/1
  # GET /fishing_spots/1.json
  def show
  end

  # GET /fishing_spots/new
  def new
    @fishing_spot = FishingSpot.new
  end

  # GET /fishing_spots/1/edit
  def edit
  end

  # POST /fishing_spots
  # POST /fishing_spots.json
  def create
    @fishing_spot = FishingSpot.new(fishing_spot_params)

    respond_to do |format|
      if @fishing_spot.save
        format.html { redirect_to @fishing_spot, notice: 'Fishing spot was successfully created.' }
        format.json { render :show, status: :created, location: @fishing_spot }
      else
        format.html { render :new }
        format.json { render json: @fishing_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fishing_spots/1
  # PATCH/PUT /fishing_spots/1.json
  def update
    respond_to do |format|
      if @fishing_spot.update(fishing_spot_params)
        format.html { redirect_to @fishing_spot, notice: 'Fishing spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @fishing_spot }
      else
        format.html { render :edit }
        format.json { render json: @fishing_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fishing_spots/1
  # DELETE /fishing_spots/1.json
  def destroy
    @fishing_spot.destroy
    respond_to do |format|
      format.html { redirect_to fishing_spots_url, notice: 'Fishing spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fishing_spot
      @fishing_spot = FishingSpot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fishing_spot_params
      params.require(:fishing_spot).permit(:name)
    end
end
