class CollectibleAttributesController < ApplicationController
  before_action :set_collectible_attribute, only: [:show, :edit, :update, :destroy]

  # GET /collectible_attributes
  # GET /collectible_attributes.json
  def index
    @collectible_attributes = CollectibleAttribute.all
  end

  # GET /collectible_attributes/1
  # GET /collectible_attributes/1.json
  def show
  end

  # GET /collectible_attributes/new
  def new
    @collectible_attribute = CollectibleAttribute.new
  end

  # GET /collectible_attributes/1/edit
  def edit
  end

  # POST /collectible_attributes
  # POST /collectible_attributes.json
  def create
    @collectible_attribute = CollectibleAttribute.new(collectible_attribute_params)

    respond_to do |format|
      if @collectible_attribute.save
        format.html { redirect_to @collectible_attribute, notice: 'Collectible attribute was successfully created.' }
        format.json { render :show, status: :created, location: @collectible_attribute }
      else
        format.html { render :new }
        format.json { render json: @collectible_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectible_attributes/1
  # PATCH/PUT /collectible_attributes/1.json
  def update
    respond_to do |format|
      if @collectible_attribute.update(collectible_attribute_params)
        format.html { redirect_to @collectible_attribute, notice: 'Collectible attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @collectible_attribute }
      else
        format.html { render :edit }
        format.json { render json: @collectible_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectible_attributes/1
  # DELETE /collectible_attributes/1.json
  def destroy
    @collectible_attribute.destroy
    respond_to do |format|
      format.html { redirect_to collectible_attributes_url, notice: 'Collectible attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collectible_attribute
      @collectible_attribute = CollectibleAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collectible_attribute_params
      params.require(:collectible_attribute).permit(:name, :collectible_id)
    end
end
