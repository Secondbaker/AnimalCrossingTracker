class CollectibleSortsController < ApplicationController
  before_action :set_collectible_sort, only: [:show, :edit, :update, :destroy]

  # GET /collectible_sorts
  # GET /collectible_sorts.json
  def index
    @collectible_sorts = CollectibleSort.all
  end

  # GET /collectible_sorts/1
  # GET /collectible_sorts/1.json
  def show
  end

  # GET /collectible_sorts/new
  def new
    @collectible_sort = CollectibleSort.new
  end

  # GET /collectible_sorts/1/edit
  def edit
  end

  # POST /collectible_sorts
  # POST /collectible_sorts.json
  def create
    @collectible_sort = CollectibleSort.new(collectible_sort_params)

    respond_to do |format|
      if @collectible_sort.save
        format.html { redirect_to @collectible_sort, notice: 'Collectible sort was successfully created.' }
        format.json { render :show, status: :created, location: @collectible_sort }
      else
        format.html { render :new }
        format.json { render json: @collectible_sort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectible_sorts/1
  # PATCH/PUT /collectible_sorts/1.json
  def update
    respond_to do |format|
      if @collectible_sort.update(collectible_sort_params)
        format.html { redirect_to @collectible_sort, notice: 'Collectible sort was successfully updated.' }
        format.json { render :show, status: :ok, location: @collectible_sort }
      else
        format.html { render :edit }
        format.json { render json: @collectible_sort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectible_sorts/1
  # DELETE /collectible_sorts/1.json
  def destroy
    @collectible_sort.destroy
    respond_to do |format|
      format.html { redirect_to collectible_sorts_url, notice: 'Collectible sort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collectible_sort
      @collectible_sort = CollectibleSort.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collectible_sort_params
      params.require(:collectible_sort).permit(:name, :keyword, :collectible_attribute_class_name)
    end
end
