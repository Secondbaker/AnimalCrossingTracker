class BugSpotsController < ApplicationController
  before_action :set_bug_spot, only: [:show, :edit, :update, :destroy]

  # GET /bug_spots
  # GET /bug_spots.json
  def index
    @bug_spots = BugSpot.all
  end

  # GET /bug_spots/1
  # GET /bug_spots/1.json
  def show
  end

  # GET /bug_spots/new
  def new
    @bug_spot = BugSpot.new
  end

  # GET /bug_spots/1/edit
  def edit
  end

  # POST /bug_spots
  # POST /bug_spots.json
  def create
    @bug_spot = BugSpot.new(bug_spot_params)

    respond_to do |format|
      if @bug_spot.save
        format.html { redirect_to @bug_spot, notice: 'Bug spot was successfully created.' }
        format.json { render :show, status: :created, location: @bug_spot }
      else
        format.html { render :new }
        format.json { render json: @bug_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bug_spots/1
  # PATCH/PUT /bug_spots/1.json
  def update
    respond_to do |format|
      if @bug_spot.update(bug_spot_params)
        format.html { redirect_to @bug_spot, notice: 'Bug spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug_spot }
      else
        format.html { render :edit }
        format.json { render json: @bug_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_spots/1
  # DELETE /bug_spots/1.json
  def destroy
    @bug_spot.destroy
    respond_to do |format|
      format.html { redirect_to bug_spots_url, notice: 'Bug spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug_spot
      @bug_spot = BugSpot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bug_spot_params
      params.fetch(:bug_spot, {})
    end
end
