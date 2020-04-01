class VillagerCatchphrasesController < ApplicationController
  before_action :set_villager_catchphrase, only: [:show, :edit, :update, :destroy]

  # GET /villager_catchphrases
  # GET /villager_catchphrases.json
  def index
    @villager_catchphrases = VillagerCatchphrase.all
  end

  # GET /villager_catchphrases/1
  # GET /villager_catchphrases/1.json
  def show
  end

  # GET /villager_catchphrases/new
  def new
    @villager_catchphrase = VillagerCatchphrase.new
  end

  # GET /villager_catchphrases/1/edit
  def edit
  end

  # POST /villager_catchphrases
  # POST /villager_catchphrases.json
  def create
    @villager_catchphrase = VillagerCatchphrase.new(villager_catchphrase_params)

    respond_to do |format|
      if @villager_catchphrase.save
        format.html { redirect_to @villager_catchphrase, notice: 'Villager catchphrase was successfully created.' }
        format.json { render :show, status: :created, location: @villager_catchphrase }
      else
        format.html { render :new }
        format.json { render json: @villager_catchphrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villager_catchphrases/1
  # PATCH/PUT /villager_catchphrases/1.json
  def update
    respond_to do |format|
      if @villager_catchphrase.update(villager_catchphrase_params)
        format.html { redirect_to @villager_catchphrase, notice: 'Villager catchphrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @villager_catchphrase }
      else
        format.html { render :edit }
        format.json { render json: @villager_catchphrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villager_catchphrases/1
  # DELETE /villager_catchphrases/1.json
  def destroy
    @villager_catchphrase.destroy
    respond_to do |format|
      format.html { redirect_to villager_catchphrases_url, notice: 'Villager catchphrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_villager_catchphrase
      @villager_catchphrase = VillagerCatchphrase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def villager_catchphrase_params
      params.fetch(:villager_catchphrase, {})
    end
end
