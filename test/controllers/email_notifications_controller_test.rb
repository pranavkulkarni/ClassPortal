require 'test_helper'

class EmailNotificationsControllerTest < ActionController::TestCase
  setup do
    @email_notification = email_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_notification" do
    assert_difference('EmailNotification.count') do
      post :create, email_notification: {  }
    end

    assert_redirected_to email_notification_path(assigns(:email_notification))
  end

  test "should show email_notification" do
    get :show, id: @email_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_notification
    assert_response :success
  end

  test "should update email_notification" do
    patch :update, id: @email_notification, email_notification: {  }
    assert_redirected_to email_notification_path(assigns(:email_notification))
  end

  test "should destroy email_notification" do
    assert_difference('EmailNotification.count', -1) do
      delete :destroy, id: @email_notification
    end

    assert_redirected_to email_notifications_path
  end
end
