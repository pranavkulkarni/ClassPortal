require 'test_helper'

class CourseMaterialsControllerTest < ActionController::TestCase
  setup do
    @course_material = course_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_material" do
    assert_difference('CourseMaterial.count') do
      post :create, course_material: { message: @course_material.message, title: @course_material.title }
    end

    assert_redirected_to course_material_path(assigns(:course_material))
  end

  test "should show course_material" do
    get :show, id: @course_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_material
    assert_response :success
  end

  test "should update course_material" do
    patch :update, id: @course_material, course_material: { message: @course_material.message, title: @course_material.title }
    assert_redirected_to course_material_path(assigns(:course_material))
  end

  test "should destroy course_material" do
    assert_difference('CourseMaterial.count', -1) do
      delete :destroy, id: @course_material
    end

    assert_redirected_to course_materials_path
  end
end
