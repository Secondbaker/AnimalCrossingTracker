class VillagerPersonalitiesController < ApplicationController
  before_action :set_villager_personality, only: [:show, :edit, :update, :destroy]

  # GET /villager_personalities
  # GET /villager_personalities.json
  def index
    @villager_personalities = VillagerPersonality.all
  end

  # GET /villager_personalities/1
  # GET /villager_personalities/1.json
  def show
  end

  # GET /villager_personalities/new
  def new
    @villager_personality = VillagerPersonality.new
  end

  # GET /villager_personalities/1/edit
  def edit
  end

  # POST /villager_personalities
  # POST /villager_personalities.json
  def create
    @villager_personality = VillagerPersonality.new(villager_personality_params)

    respond_to do |format|
      if @villager_personality.save
        format.html { redirect_to @villager_personality, notice: 'Villager personality was successfully created.' }
        format.json { render :show, status: :created, location: @villager_personality }
      else
        format.html { render :new }
        format.json { render json: @villager_personality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villager_personalities/1
  # PATCH/PUT /villager_personalities/1.json
  def update
    respond_to do |format|
      if @villager_personality.update(villager_personality_params)
        format.html { redirect_to @villager_personality, notice: 'Villager personality was successfully updated.' }
        format.json { render :show, status: :ok, location: @villager_personality }
      else
        format.html { render :edit }
        format.json { render json: @villager_personality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villager_personalities/1
  # DELETE /villager_personalities/1.json
  def destroy
    @villager_personality.destroy
    respond_to do |format|
      format.html { redirect_to villager_personalities_url, notice: 'Villager personality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_villager_personality
      @villager_personality = VillagerPersonality.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def villager_personality_params
      params.fetch(:villager_personality, {})
    end
end
