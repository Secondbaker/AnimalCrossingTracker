class BellValuesController < ApplicationController
  before_action :set_bell_value, only: [:show, :edit, :update, :destroy]

  # GET /bell_values
  # GET /bell_values.json
  def index
    @bell_values = BellValue.all
  end

  # GET /bell_values/1
  # GET /bell_values/1.json
  def show
  end

  # GET /bell_values/new
  def new
    @bell_value = BellValue.new
  end

  # GET /bell_values/1/edit
  def edit
  end

  # POST /bell_values
  # POST /bell_values.json
  def create
    @bell_value = BellValue.new(bell_value_params)

    respond_to do |format|
      if @bell_value.save
        format.html { redirect_to @bell_value, notice: 'Bell value was successfully created.' }
        format.json { render :show, status: :created, location: @bell_value }
      else
        format.html { render :new }
        format.json { render json: @bell_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bell_values/1
  # PATCH/PUT /bell_values/1.json
  def update
    respond_to do |format|
      if @bell_value.update(bell_value_params)
        format.html { redirect_to @bell_value, notice: 'Bell value was successfully updated.' }
        format.json { render :show, status: :ok, location: @bell_value }
      else
        format.html { render :edit }
        format.json { render json: @bell_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bell_values/1
  # DELETE /bell_values/1.json
  def destroy
    @bell_value.destroy
    respond_to do |format|
      format.html { redirect_to bell_values_url, notice: 'Bell value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bell_value
      @bell_value = BellValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bell_value_params
      params.require(:bell_value).permit(:value, :collectible_id)
    end
end
