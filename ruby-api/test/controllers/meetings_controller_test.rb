require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  setup do
    @meeting = meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post :create, meeting: { buildingCode: @meeting.buildingCode, courseNumber: @meeting.courseNumber, deptCode: @meeting.deptCode, meetingDay: @meeting.meetingDay, period: @meeting.period, roomNumber: @meeting.roomNumber, sectionNumber: @meeting.sectionNumber }
    end

    assert_response 201
  end

  test "should show meeting" do
    get :show, id: @meeting
    assert_response :success
  end

  test "should update meeting" do
    put :update, id: @meeting, meeting: { buildingCode: @meeting.buildingCode, courseNumber: @meeting.courseNumber, deptCode: @meeting.deptCode, meetingDay: @meeting.meetingDay, period: @meeting.period, roomNumber: @meeting.roomNumber, sectionNumber: @meeting.sectionNumber }
    assert_response 204
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete :destroy, id: @meeting
    end

    assert_response 204
  end
end
