require 'test_helper'

class PeriodsControllerTest < ActionController::TestCase
  setup do
    @period = periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periods)
  end

  test "should create period" do
    assert_difference('Period.count') do
      post :create, period: { period: @period.period, startTime: @period.startTime }
    end

    assert_response 201
  end

  test "should show period" do
    get :show, id: @period
    assert_response :success
  end

  test "should update period" do
    put :update, id: @period, period: { period: @period.period, startTime: @period.startTime }
    assert_response 204
  end

  test "should destroy period" do
    assert_difference('Period.count', -1) do
      delete :destroy, id: @period
    end

    assert_response 204
  end
end
