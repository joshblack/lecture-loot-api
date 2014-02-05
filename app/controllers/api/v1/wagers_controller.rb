class Api::V1::WagersController < ApplicationController
  # GET /wagers
  # GET /wagers.json
  def index
    @wagers = Wager.all

    render json: @wagers
  end

  # GET /wagers/1
  # GET /wagers/1.json
  def show
    @wager = Wager.find(params[:id])

    render json: @wager
  end

  # POST /wagers
  # POST /wagers.json
  def create
    @wager = Wager.new(params[:wager])

    if @wager.save
      render json: @wager, status: :created, location: @wager
    else
      render json: @wager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wagers/1
  # PATCH/PUT /wagers/1.json
  def update
    @wager = Wager.find(params[:id])

    if @wager.update(params[:wager])
      head :no_content
    else
      render json: @wager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wagers/1
  # DELETE /wagers/1.json
  def destroy
    @wager = Wager.find(params[:id])
    @wager.destroy

    head :no_content
  end
end
