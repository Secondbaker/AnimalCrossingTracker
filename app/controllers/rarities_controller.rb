class RaritiesController < ApplicationController
  before_action :set_rarity, only: [:show, :edit, :update, :destroy]

  # GET /rarities
  # GET /rarities.json
  def index
    @rarities = Rarity.all
  end

  # GET /rarities/1
  # GET /rarities/1.json
  def show
  end

  # GET /rarities/new
  def new
    @rarity = Rarity.new
  end

  # GET /rarities/1/edit
  def edit
  end

  # POST /rarities
  # POST /rarities.json
  def create
    @rarity = Rarity.new(rarity_params)

    respond_to do |format|
      if @rarity.save
        format.html { redirect_to @rarity, notice: 'Rarity was successfully created.' }
        format.json { render :show, status: :created, location: @rarity }
      else
        format.html { render :new }
        format.json { render json: @rarity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rarities/1
  # PATCH/PUT /rarities/1.json
  def update
    respond_to do |format|
      if @rarity.update(rarity_params)
        format.html { redirect_to @rarity, notice: 'Rarity was successfully updated.' }
        format.json { render :show, status: :ok, location: @rarity }
      else
        format.html { render :edit }
        format.json { render json: @rarity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rarities/1
  # DELETE /rarities/1.json
  def destroy
    @rarity.destroy
    respond_to do |format|
      format.html { redirect_to rarities_url, notice: 'Rarity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rarity
      @rarity = Rarity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rarity_params
      params.require(:rarity).permit(:value, :collectible_id)
    end
end
