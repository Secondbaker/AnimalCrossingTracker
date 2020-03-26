class FishSizesController < ApplicationController
  before_action :set_fish_size, only: [:show, :edit, :update, :destroy]

  # GET /fish_sizes
  # GET /fish_sizes.json
  def index
    @fish_sizes = FishSize.all
  end

  # GET /fish_sizes/1
  # GET /fish_sizes/1.json
  def show
  end

  # GET /fish_sizes/new
  def new
    @fish_size = FishSize.new
  end

  # GET /fish_sizes/1/edit
  def edit
  end

  # POST /fish_sizes
  # POST /fish_sizes.json
  def create
    @fish_size = FishSize.new(fish_size_params)

    respond_to do |format|
      if @fish_size.save
        format.html { redirect_to @fish_size, notice: 'Fish size was successfully created.' }
        format.json { render :show, status: :created, location: @fish_size }
      else
        format.html { render :new }
        format.json { render json: @fish_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fish_sizes/1
  # PATCH/PUT /fish_sizes/1.json
  def update
    respond_to do |format|
      if @fish_size.update(fish_size_params)
        format.html { redirect_to @fish_size, notice: 'Fish size was successfully updated.' }
        format.json { render :show, status: :ok, location: @fish_size }
      else
        format.html { render :edit }
        format.json { render json: @fish_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish_sizes/1
  # DELETE /fish_sizes/1.json
  def destroy
    @fish_size.destroy
    respond_to do |format|
      format.html { redirect_to fish_sizes_url, notice: 'Fish size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish_size
      @fish_size = FishSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fish_size_params
      params.require(:fish_size).permit(:name)
    end
end
