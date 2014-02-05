class Api::V1::CurrentSessionsController < ApplicationController
  # GET /current_sessions
  # GET /current_sessions.json
  def index
    @current_sessions = CurrentSession.all

    render json: @current_sessions
  end

  # GET /current_sessions/1
  # GET /current_sessions/1.json
  def show
    @current_session = CurrentSession.find(params[:id])

    render json: @current_session
  end

  # POST /current_sessions
  # POST /current_sessions.json
  def create
    @current_session = CurrentSession.new(params[:current_session])

    if @current_session.save
      render json: @current_session, status: :created, location: @current_session
    else
      render json: @current_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /current_sessions/1
  # PATCH/PUT /current_sessions/1.json
  def update
    @current_session = CurrentSession.find(params[:id])

    if @current_session.update(params[:current_session])
      head :no_content
    else
      render json: @current_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /current_sessions/1
  # DELETE /current_sessions/1.json
  def destroy
    @current_session = CurrentSession.find(params[:id])
    @current_session.destroy

    head :no_content
  end
end
