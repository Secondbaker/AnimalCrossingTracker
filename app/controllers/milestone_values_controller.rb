class MilestoneValuesController < ApplicationController
  before_action :set_milestone_value, only: [:show, :edit, :update, :destroy]

  # GET /milestone_values
  # GET /milestone_values.json
  def index
    @milestone_values = MilestoneValue.all
  end

  # GET /milestone_values/1
  # GET /milestone_values/1.json
  def show
  end

  # GET /milestone_values/new
  def new
    @milestone_value = MilestoneValue.new
  end

  # GET /milestone_values/1/edit
  def edit
  end

  # POST /milestone_values
  # POST /milestone_values.json
  def create
    @milestone_value = MilestoneValue.new(milestone_value_params)

    respond_to do |format|
      if @milestone_value.save
        format.html { redirect_to @milestone_value, notice: 'Milestone value was successfully created.' }
        format.json { render :show, status: :created, location: @milestone_value }
      else
        format.html { render :new }
        format.json { render json: @milestone_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestone_values/1
  # PATCH/PUT /milestone_values/1.json
  def update
    respond_to do |format|
      if @milestone_value.update(milestone_value_params)
        format.html { redirect_to @milestone_value, notice: 'Milestone value was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone_value }
      else
        format.html { render :edit }
        format.json { render json: @milestone_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestone_values/1
  # DELETE /milestone_values/1.json
  def destroy
    @milestone_value.destroy
    respond_to do |format|
      format.html { redirect_to milestone_values_url, notice: 'Milestone value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone_value
      @milestone_value = MilestoneValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def milestone_value_params
      params.require(:milestone_value).permit(:milestone_id)
    end
end
