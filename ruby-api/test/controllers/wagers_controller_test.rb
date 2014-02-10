require 'test_helper'

class WagersControllerTest < ActionController::TestCase
  setup do
    @wager = wagers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wagers)
  end

  test "should create wager" do
    assert_difference('Wager.count') do
      post :create, wager: { pointsLost: @wager.pointsLost, sessionId: @wager.sessionId, userId: @wager.userId, wagerTotalValue: @wager.wagerTotalValue, wagerUnitValue: @wager.wagerUnitValue }
    end

    assert_response 201
  end

  test "should show wager" do
    get :show, id: @wager
    assert_response :success
  end

  test "should update wager" do
    put :update, id: @wager, wager: { pointsLost: @wager.pointsLost, sessionId: @wager.sessionId, userId: @wager.userId, wagerTotalValue: @wager.wagerTotalValue, wagerUnitValue: @wager.wagerUnitValue }
    assert_response 204
  end

  test "should destroy wager" do
    assert_difference('Wager.count', -1) do
      delete :destroy, id: @wager
    end

    assert_response 204
  end
end
