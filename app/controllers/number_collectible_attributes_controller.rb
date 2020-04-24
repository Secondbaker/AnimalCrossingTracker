class NumberCollectibleAttributesController < ApplicationController
  before_action :set_number_collectible_attribute, only: [:show, :edit, :update, :destroy]

  # GET /number_collectible_attributes
  # GET /number_collectible_attributes.json
  def index
    @number_collectible_attributes = NumberCollectibleAttribute.all
  end

  # GET /number_collectible_attributes/1
  # GET /number_collectible_attributes/1.json
  def show
  end

  # GET /number_collectible_attributes/new
  def new
    @number_collectible_attribute = NumberCollectibleAttribute.new
  end

  # GET /number_collectible_attributes/1/edit
  def edit
  end

  # POST /number_collectible_attributes
  # POST /number_collectible_attributes.json
  def create
    @number_collectible_attribute = NumberCollectibleAttribute.new(number_collectible_attribute_params)

    respond_to do |format|
      if @number_collectible_attribute.save
        format.html { redirect_to @number_collectible_attribute, notice: 'Number collectible attribute was successfully created.' }
        format.json { render :show, status: :created, location: @number_collectible_attribute }
      else
        format.html { render :new }
        format.json { render json: @number_collectible_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /number_collectible_attributes/1
  # PATCH/PUT /number_collectible_attributes/1.json
  def update
    respond_to do |format|
      if @number_collectible_attribute.update(number_collectible_attribute_params)
        format.html { redirect_to @number_collectible_attribute, notice: 'Number collectible attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @number_collectible_attribute }
      else
        format.html { render :edit }
        format.json { render json: @number_collectible_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /number_collectible_attributes/1
  # DELETE /number_collectible_attributes/1.json
  def destroy
    @number_collectible_attribute.destroy
    respond_to do |format|
      format.html { redirect_to number_collectible_attributes_url, notice: 'Number collectible attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number_collectible_attribute
      @number_collectible_attribute = NumberCollectibleAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def number_collectible_attribute_params
      params.require(:number_collectible_attribute).permit(:value)
    end
end
