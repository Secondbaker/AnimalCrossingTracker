class VillagerSpeciesController < ApplicationController
  before_action :set_villager_specy, only: [:show, :edit, :update, :destroy]

  # GET /villager_species
  # GET /villager_species.json
  def index
    @villager_species = VillagerSpecies.all
  end

  # GET /villager_species/1
  # GET /villager_species/1.json
  def show
  end

  # GET /villager_species/new
  def new
    @villager_specy = VillagerSpecies.new
  end

  # GET /villager_species/1/edit
  def edit
  end

  # POST /villager_species
  # POST /villager_species.json
  def create
    @villager_specy = VillagerSpecies.new(villager_specy_params)

    respond_to do |format|
      if @villager_specy.save
        format.html { redirect_to @villager_specy, notice: 'Villager species was successfully created.' }
        format.json { render :show, status: :created, location: @villager_specy }
      else
        format.html { render :new }
        format.json { render json: @villager_specy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villager_species/1
  # PATCH/PUT /villager_species/1.json
  def update
    respond_to do |format|
      if @villager_specy.update(villager_specy_params)
        format.html { redirect_to @villager_specy, notice: 'Villager species was successfully updated.' }
        format.json { render :show, status: :ok, location: @villager_specy }
      else
        format.html { render :edit }
        format.json { render json: @villager_specy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villager_species/1
  # DELETE /villager_species/1.json
  def destroy
    @villager_specy.destroy
    respond_to do |format|
      format.html { redirect_to villager_species_index_url, notice: 'Villager species was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_villager_specy
      @villager_specy = VillagerSpecies.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def villager_specy_params
      params.fetch(:villager_specy, {})
    end
end
