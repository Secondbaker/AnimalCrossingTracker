class FishingLocationsController < ApplicationController
  before_action :set_fishing_location, only: [:show, :edit, :update, :destroy]

  # GET /fishing_locations
  # GET /fishing_locations.json
  def index
    @fishing_locations = FishingLocation.all
  end

  # GET /fishing_locations/1
  # GET /fishing_locations/1.json
  def show
  end

  # GET /fishing_locations/new
  def new
    @fishing_location = FishingLocation.new
  end

  # GET /fishing_locations/1/edit
  def edit
  end

  # POST /fishing_locations
  # POST /fishing_locations.json
  def create
    @fishing_location = FishingLocation.new(fishing_location_params)

    respond_to do |format|
      if @fishing_location.save
        format.html { redirect_to @fishing_location, notice: 'Fishing location was successfully created.' }
        format.json { render :show, status: :created, location: @fishing_location }
      else
        format.html { render :new }
        format.json { render json: @fishing_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fishing_locations/1
  # PATCH/PUT /fishing_locations/1.json
  def update
    respond_to do |format|
      if @fishing_location.update(fishing_location_params)
        format.html { redirect_to @fishing_location, notice: 'Fishing location was successfully updated.' }
        format.json { render :show, status: :ok, location: @fishing_location }
      else
        format.html { render :edit }
        format.json { render json: @fishing_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fishing_locations/1
  # DELETE /fishing_locations/1.json
  def destroy
    @fishing_location.destroy
    respond_to do |format|
      format.html { redirect_to fishing_locations_url, notice: 'Fishing location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fishing_location
      @fishing_location = FishingLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fishing_location_params
      params.require(:fishing_location).permit(:name)
    end
end
