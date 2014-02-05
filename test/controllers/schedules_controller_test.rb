require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedules)
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post :create, schedule: { courseNumber: @schedule.courseNumber, deptCode: @schedule.deptCode, sectionNumber: @schedule.sectionNumber, userId: @schedule.userId }
    end

    assert_response 201
  end

  test "should show schedule" do
    get :show, id: @schedule
    assert_response :success
  end

  test "should update schedule" do
    put :update, id: @schedule, schedule: { courseNumber: @schedule.courseNumber, deptCode: @schedule.deptCode, sectionNumber: @schedule.sectionNumber, userId: @schedule.userId }
    assert_response 204
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete :destroy, id: @schedule
    end

    assert_response 204
  end
end
