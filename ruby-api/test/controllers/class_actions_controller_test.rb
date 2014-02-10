require 'test_helper'

class ClassActionsControllerTest < ActionController::TestCase
  setup do
    @class_action = class_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_actions)
  end

  test "should create class_action" do
    assert_difference('ClassAction.count') do
      post :create, class_action: { cancelled: @class_action.cancelled, checkedIn: @class_action.checkedIn, meetingDay: @class_action.meetingDay, period: @class_action.period, sectionNumber: @class_action.sectionNumber, userId: @class_action.userId }
    end

    assert_response 201
  end

  test "should show class_action" do
    get :show, id: @class_action
    assert_response :success
  end

  test "should update class_action" do
    put :update, id: @class_action, class_action: { cancelled: @class_action.cancelled, checkedIn: @class_action.checkedIn, meetingDay: @class_action.meetingDay, period: @class_action.period, sectionNumber: @class_action.sectionNumber, userId: @class_action.userId }
    assert_response 204
  end

  test "should destroy class_action" do
    assert_difference('ClassAction.count', -1) do
      delete :destroy, id: @class_action
    end

    assert_response 204
  end
end
