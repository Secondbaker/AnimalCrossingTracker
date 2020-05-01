class CollectibleFiltersController < ApplicationController
  before_action :set_collectible_filter, only: [:show, :edit, :update, :destroy]

  # GET /collectible_filters
  # GET /collectible_filters.json
  def index
    @collectible_filters = CollectibleFilter.all
  end

  # GET /collectible_filters/1
  # GET /collectible_filters/1.json
  def show
  end

  # GET /collectible_filters/new
  def new
    @collectible_filter = CollectibleFilter.new
  end

  # GET /collectible_filters/1/edit
  def edit
  end

  # POST /collectible_filters
  # POST /collectible_filters.json
  def create
    @collectible_filter = CollectibleFilter.new(collectible_filter_params)

    respond_to do |format|
      if @collectible_filter.save
        format.html { redirect_to @collectible_filter, notice: 'Collectible filter was successfully created.' }
        format.json { render :show, status: :created, location: @collectible_filter }
      else
        format.html { render :new }
        format.json { render json: @collectible_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectible_filters/1
  # PATCH/PUT /collectible_filters/1.json
  def update
    respond_to do |format|
      if @collectible_filter.update(collectible_filter_params)
        format.html { redirect_to @collectible_filter, notice: 'Collectible filter was successfully updated.' }
        format.json { render :show, status: :ok, location: @collectible_filter }
      else
        format.html { render :edit }
        format.json { render json: @collectible_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectible_filters/1
  # DELETE /collectible_filters/1.json
  def destroy
    @collectible_filter.destroy
    respond_to do |format|
      format.html { redirect_to collectible_filters_url, notice: 'Collectible filter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collectible_filter
      @collectible_filter = CollectibleFilter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collectible_filter_params
      params.require(:collectible_filter).permit(:name, :keyword, :collectible_attribute_class_name)
    end
end
