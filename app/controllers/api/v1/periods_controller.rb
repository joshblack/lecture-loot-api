class Api::V1::PeriodsController < ApplicationController
  # GET /periods
  # GET /periods.json
  def index
    @periods = Period.all

    render json: @periods
  end

  # GET /periods/1
  # GET /periods/1.json
  def show
    @period = Period.find(params[:id])

    render json: @period
  end

  # POST /periods
  # POST /periods.json
  def create
    @period = Period.new(params[:period])

    if @period.save
      render json: @period, status: :created, location: @period
    else
      render json: @period.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /periods/1
  # PATCH/PUT /periods/1.json
  def update
    @period = Period.find(params[:id])

    if @period.update(params[:period])
      head :no_content
    else
      render json: @period.errors, status: :unprocessable_entity
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    @period = Period.find(params[:id])
    @period.destroy

    head :no_content
  end
end
