# frozen_string_literal: true

class CollectibleAttributeTypesController < ApplicationController
  before_action :set_collectible_attribute_type, only: %i[show edit update destroy]

  # GET /collectible_attribute_types
  # GET /collectible_attribute_types.json
  def index
    @collectible_attribute_types = CollectibleAttributeType.all
  end

  # GET /collectible_attribute_types/1
  # GET /collectible_attribute_types/1.json
  def show; end

  # GET /collectible_attribute_types/new
  def new
    @collectible_attribute_type = CollectibleAttributeType.new
  end

  # GET /collectible_attribute_types/1/edit
  def edit; end

  # POST /collectible_attribute_types
  # POST /collectible_attribute_types.json
  def create
    @collectible_attribute_type = CollectibleAttributeType.new(collectible_attribute_type_params)

    respond_to do |format|
      if @collectible_attribute_type.save
        format.html { redirect_to @collectible_attribute_type, notice: 'Collectible attribute type was successfully created.' }
        format.json { render :show, status: :created, location: @collectible_attribute_type }
      else
        format.html { render :new }
        format.json { render json: @collectible_attribute_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectible_attribute_types/1
  # PATCH/PUT /collectible_attribute_types/1.json
  def update
    respond_to do |format|
      if @collectible_attribute_type.update(collectible_attribute_type_params)
        format.html { redirect_to @collectible_attribute_type, notice: 'Collectible attribute type was successfully updated.' }
        format.json { render :show, status: :ok, location: @collectible_attribute_type }
      else
        format.html { render :edit }
        format.json { render json: @collectible_attribute_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectible_attribute_types/1
  # DELETE /collectible_attribute_types/1.json
  def destroy
    @collectible_attribute_type.destroy
    respond_to do |format|
      format.html { redirect_to collectible_attribute_types_url, notice: 'Collectible attribute type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collectible_attribute_type
    @collectible_attribute_type = CollectibleAttributeType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def collectible_attribute_type_params
    params.require(:collectible_attribute_type).permit(:name)
  end
end
