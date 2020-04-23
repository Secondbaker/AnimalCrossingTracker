class StringCollectibleAttributesController < ApplicationController
  before_action :set_string_collectible_attribute, only: [:show, :edit, :update, :destroy]

  # GET /string_collectible_attributes
  # GET /string_collectible_attributes.json
  def index
    @string_collectible_attributes = StringCollectibleAttribute.all
  end

  # GET /string_collectible_attributes/1
  # GET /string_collectible_attributes/1.json
  def show
  end

  # GET /string_collectible_attributes/new
  def new
    @string_collectible_attribute = StringCollectibleAttribute.new
  end

  # GET /string_collectible_attributes/1/edit
  def edit
  end

  # POST /string_collectible_attributes
  # POST /string_collectible_attributes.json
  def create
    @string_collectible_attribute = StringCollectibleAttribute.new(string_collectible_attribute_params)

    respond_to do |format|
      if @string_collectible_attribute.save
        format.html { redirect_to @string_collectible_attribute, notice: 'String collectible attribute was successfully created.' }
        format.json { render :show, status: :created, location: @string_collectible_attribute }
      else
        format.html { render :new }
        format.json { render json: @string_collectible_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /string_collectible_attributes/1
  # PATCH/PUT /string_collectible_attributes/1.json
  def update
    respond_to do |format|
      if @string_collectible_attribute.update(string_collectible_attribute_params)
        format.html { redirect_to @string_collectible_attribute, notice: 'String collectible attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @string_collectible_attribute }
      else
        format.html { render :edit }
        format.json { render json: @string_collectible_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /string_collectible_attributes/1
  # DELETE /string_collectible_attributes/1.json
  def destroy
    @string_collectible_attribute.destroy
    respond_to do |format|
      format.html { redirect_to string_collectible_attributes_url, notice: 'String collectible attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_string_collectible_attribute
      @string_collectible_attribute = StringCollectibleAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def string_collectible_attribute_params
      params.require(:string_collectible_attribute).permit(:value)
    end
end
