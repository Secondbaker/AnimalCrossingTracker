# frozen_string_literal: true

class CollectiblesController < ApplicationController
  before_action :set_collectible, only: %i[show edit update destroy]

  # GET /collectibles
  # GET /collectibles.json
  def index
    @collectibles = Collectible.all
  end

  # GET /collectibles/1
  # GET /collectibles/1.json
  def show; end

  # GET /collectibles/new
  def new
    @collectible = Collectible.new
  end

  # GET /collectibles/1/edit
  def edit; end

  # POST /collectibles
  # POST /collectibles.json
  def create
    @collectible = Collectible.new(collectible_params)

    respond_to do |format|
      if @collectible.save
        format.html { redirect_to @collectible, notice: 'Collectible was successfully created.' }
        format.json { render :show, status: :created, location: @collectible }
      else
        format.html { render :new }
        format.json { render json: @collectible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectibles/1
  # PATCH/PUT /collectibles/1.json
  def update
    respond_to do |format|
      if @collectible.update(collectible_params)
        format.html { redirect_to @collectible, notice: 'Collectible was successfully updated.' }
        format.json { render :show, status: :ok, location: @collectible }
      else
        format.html { render :edit }
        format.json { render json: @collectible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectibles/1/toggle/
  def toggle
    @collectible = Collectible.find(params[:collectible_id])
    @user = User.find(params[:user_id])
    @my_collected_collectible = @user.my_collected_collectibles.find_by(collectible_id: @collectible.id)
    @my_collected_collectible.completions['first'] = @my_collected_collectible.completions['first'] == 'true' ? 'false':'true'
    if @my_collected_collectible.save
      #redirect_to island_collection_path(@collectible.island_collection, anchor: @collectible.id)
    else
      render json: @collectible.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collectibles/1
  # DELETE /collectibles/1.json
  def destroy
    @collectible.destroy
    respond_to do |format|
      format.html { redirect_to collectibles_url, notice: 'Collectible was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collectible
    @collectible = Collectible.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def collectible_params
    params.require(:collectible).permit(:island_collection_id)
  end
end
