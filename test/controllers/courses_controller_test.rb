require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { courseNumber: @course.courseNumber, courseTitle: @course.courseTitle, credits: @course.credits, deptCode: @course.deptCode, instructor: @course.instructor, sectionNumber: @course.sectionNumber }
    end

    assert_response 201
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, id: @course, course: { courseNumber: @course.courseNumber, courseTitle: @course.courseTitle, credits: @course.credits, deptCode: @course.deptCode, instructor: @course.instructor, sectionNumber: @course.sectionNumber }
    assert_response 204
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_response 204
  end
end
