class PersonalityTypesController < ApplicationController
  before_action :set_personality_type, only: [:show, :edit, :update, :destroy]

  # GET /personality_types
  # GET /personality_types.json
  def index
    @personality_types = PersonalityType.all
  end

  # GET /personality_types/1
  # GET /personality_types/1.json
  def show
  end

  # GET /personality_types/new
  def new
    @personality_type = PersonalityType.new
  end

  # GET /personality_types/1/edit
  def edit
  end

  # POST /personality_types
  # POST /personality_types.json
  def create
    @personality_type = PersonalityType.new(personality_type_params)

    respond_to do |format|
      if @personality_type.save
        format.html { redirect_to @personality_type, notice: 'Personality type was successfully created.' }
        format.json { render :show, status: :created, location: @personality_type }
      else
        format.html { render :new }
        format.json { render json: @personality_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personality_types/1
  # PATCH/PUT /personality_types/1.json
  def update
    respond_to do |format|
      if @personality_type.update(personality_type_params)
        format.html { redirect_to @personality_type, notice: 'Personality type was successfully updated.' }
        format.json { render :show, status: :ok, location: @personality_type }
      else
        format.html { render :edit }
        format.json { render json: @personality_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personality_types/1
  # DELETE /personality_types/1.json
  def destroy
    @personality_type.destroy
    respond_to do |format|
      format.html { redirect_to personality_types_url, notice: 'Personality type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personality_type
      @personality_type = PersonalityType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personality_type_params
      params.require(:personality_type).permit(:value)
    end
end
