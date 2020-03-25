# frozen_string_literal: true

class BugLocationsController < ApplicationController
  before_action :set_bug_location, only: %i[show edit update destroy]

  # GET /bug_locations
  # GET /bug_locations.json
  def index
    @bug_locations = BugLocation.all
  end

  # GET /bug_locations/1
  # GET /bug_locations/1.json
  def show; end

  # GET /bug_locations/new
  def new
    @bug_location = BugLocation.new
  end

  # GET /bug_locations/1/edit
  def edit; end

  # POST /bug_locations
  # POST /bug_locations.json
  def create
    @bug_location = BugLocation.new(bug_location_params)

    respond_to do |format|
      if @bug_location.save
        format.html { redirect_to @bug_location, notice: 'Bug location was successfully created.' }
        format.json { render :show, status: :created, location: @bug_location }
      else
        format.html { render :new }
        format.json { render json: @bug_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bug_locations/1
  # PATCH/PUT /bug_locations/1.json
  def update
    respond_to do |format|
      if @bug_location.update(bug_location_params)
        format.html { redirect_to @bug_location, notice: 'Bug location was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug_location }
      else
        format.html { render :edit }
        format.json { render json: @bug_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_locations/1
  # DELETE /bug_locations/1.json
  def destroy
    @bug_location.destroy
    respond_to do |format|
      format.html { redirect_to bug_locations_url, notice: 'Bug location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bug_location
    @bug_location = BugLocation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bug_location_params
    params.fetch(:bug_location, {})
  end
end
