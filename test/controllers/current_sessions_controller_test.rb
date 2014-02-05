require 'test_helper'

class CurrentSessionsControllerTest < ActionController::TestCase
  setup do
    @current_session = current_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:current_sessions)
  end

  test "should create current_session" do
    assert_difference('CurrentSession.count') do
      post :create, current_session: { pointsLost: @current_session.pointsLost, sessionId: @current_session.sessionId, userId: @current_session.userId, wagerTotalValue: @current_session.wagerTotalValue, wagerUnitValue: @current_session.wagerUnitValue }
    end

    assert_response 201
  end

  test "should show current_session" do
    get :show, id: @current_session
    assert_response :success
  end

  test "should update current_session" do
    put :update, id: @current_session, current_session: { pointsLost: @current_session.pointsLost, sessionId: @current_session.sessionId, userId: @current_session.userId, wagerTotalValue: @current_session.wagerTotalValue, wagerUnitValue: @current_session.wagerUnitValue }
    assert_response 204
  end

  test "should destroy current_session" do
    assert_difference('CurrentSession.count', -1) do
      delete :destroy, id: @current_session
    end

    assert_response 204
  end
end
