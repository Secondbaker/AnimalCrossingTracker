class MoodNamesController < ApplicationController
  before_action :set_mood_name, only: [:show, :edit, :update, :destroy]

  # GET /mood_names
  # GET /mood_names.json
  def index
    @mood_names = MoodName.all
  end

  # GET /mood_names/1
  # GET /mood_names/1.json
  def show
  end

  # GET /mood_names/new
  def new
    @mood_name = MoodName.new
  end

  # GET /mood_names/1/edit
  def edit
  end

  # POST /mood_names
  # POST /mood_names.json
  def create
    @mood_name = MoodName.new(mood_name_params)

    respond_to do |format|
      if @mood_name.save
        format.html { redirect_to @mood_name, notice: 'Mood name was successfully created.' }
        format.json { render :show, status: :created, location: @mood_name }
      else
        format.html { render :new }
        format.json { render json: @mood_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mood_names/1
  # PATCH/PUT /mood_names/1.json
  def update
    respond_to do |format|
      if @mood_name.update(mood_name_params)
        format.html { redirect_to @mood_name, notice: 'Mood name was successfully updated.' }
        format.json { render :show, status: :ok, location: @mood_name }
      else
        format.html { render :edit }
        format.json { render json: @mood_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mood_names/1
  # DELETE /mood_names/1.json
  def destroy
    @mood_name.destroy
    respond_to do |format|
      format.html { redirect_to mood_names_url, notice: 'Mood name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood_name
      @mood_name = MoodName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mood_name_params
      params.require(:mood_name).permit(:string)
    end
end
