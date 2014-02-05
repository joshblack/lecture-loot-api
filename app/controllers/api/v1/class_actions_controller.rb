class Api::V1::ClassActionsController < ApplicationController
  # GET /class_actions
  # GET /class_actions.json
  def index
    @class_actions = ClassAction.all

    render json: @class_actions
  end

  # GET /class_actions/1
  # GET /class_actions/1.json
  def show
    @class_action = ClassAction.find(params[:id])

    render json: @class_action
  end

  # POST /class_actions
  # POST /class_actions.json
  def create
    @class_action = ClassAction.new(params[:class_action])

    if @class_action.save
      render json: @class_action, status: :created, location: @class_action
    else
      render json: @class_action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /class_actions/1
  # PATCH/PUT /class_actions/1.json
  def update
    @class_action = ClassAction.find(params[:id])

    if @class_action.update(params[:class_action])
      head :no_content
    else
      render json: @class_action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /class_actions/1
  # DELETE /class_actions/1.json
  def destroy
    @class_action = ClassAction.find(params[:id])
    @class_action.destroy

    head :no_content
  end
end
