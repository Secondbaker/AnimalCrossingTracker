class PassportTitlesController < ApplicationController
  before_action :set_passport_title, only: [:show, :edit, :update, :destroy]

  # GET /passport_titles
  # GET /passport_titles.json
  def index
    @passport_titles = PassportTitle.all
  end

  # GET /passport_titles/1
  # GET /passport_titles/1.json
  def show
  end

  # GET /passport_titles/new
  def new
    @passport_title = PassportTitle.new
  end

  # GET /passport_titles/1/edit
  def edit
  end

  # POST /passport_titles
  # POST /passport_titles.json
  def create
    @passport_title = PassportTitle.new(passport_title_params)

    respond_to do |format|
      if @passport_title.save
        format.html { redirect_to @passport_title, notice: 'Passport title was successfully created.' }
        format.json { render :show, status: :created, location: @passport_title }
      else
        format.html { render :new }
        format.json { render json: @passport_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passport_titles/1
  # PATCH/PUT /passport_titles/1.json
  def update
    respond_to do |format|
      if @passport_title.update(passport_title_params)
        format.html { redirect_to @passport_title, notice: 'Passport title was successfully updated.' }
        format.json { render :show, status: :ok, location: @passport_title }
      else
        format.html { render :edit }
        format.json { render json: @passport_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passport_titles/1
  # DELETE /passport_titles/1.json
  def destroy
    @passport_title.destroy
    respond_to do |format|
      format.html { redirect_to passport_titles_url, notice: 'Passport title was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passport_title
      @passport_title = PassportTitle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passport_title_params
      params.require(:passport_title).permit(:value)
    end
end
