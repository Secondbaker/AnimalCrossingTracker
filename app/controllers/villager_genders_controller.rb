class VillagerGendersController < ApplicationController
  before_action :set_villager_gender, only: [:show, :edit, :update, :destroy]

  # GET /villager_genders
  # GET /villager_genders.json
  def index
    @villager_genders = VillagerGender.all
  end

  # GET /villager_genders/1
  # GET /villager_genders/1.json
  def show
  end

  # GET /villager_genders/new
  def new
    @villager_gender = VillagerGender.new
  end

  # GET /villager_genders/1/edit
  def edit
  end

  # POST /villager_genders
  # POST /villager_genders.json
  def create
    @villager_gender = VillagerGender.new(villager_gender_params)

    respond_to do |format|
      if @villager_gender.save
        format.html { redirect_to @villager_gender, notice: 'Villager gender was successfully created.' }
        format.json { render :show, status: :created, location: @villager_gender }
      else
        format.html { render :new }
        format.json { render json: @villager_gender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villager_genders/1
  # PATCH/PUT /villager_genders/1.json
  def update
    respond_to do |format|
      if @villager_gender.update(villager_gender_params)
        format.html { redirect_to @villager_gender, notice: 'Villager gender was successfully updated.' }
        format.json { render :show, status: :ok, location: @villager_gender }
      else
        format.html { render :edit }
        format.json { render json: @villager_gender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villager_genders/1
  # DELETE /villager_genders/1.json
  def destroy
    @villager_gender.destroy
    respond_to do |format|
      format.html { redirect_to villager_genders_url, notice: 'Villager gender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_villager_gender
      @villager_gender = VillagerGender.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def villager_gender_params
      params.require(:villager_gender).permit(:value)
    end
end
