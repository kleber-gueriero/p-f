require 'test_helper'

class EventPhotosControllerTest < ActionController::TestCase
  setup do
    @event_photo = event_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_photo" do
    assert_difference('EventPhoto.count') do
      post :create, event_photo: { binary_data: @event_photo.binary_data, content_type: @event_photo.content_type, file_name: @event_photo.file_name }
    end

    assert_redirected_to event_photo_path(assigns(:event_photo))
  end

  test "should show event_photo" do
    get :show, id: @event_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_photo
    assert_response :success
  end

  test "should update event_photo" do
    put :update, id: @event_photo, event_photo: { binary_data: @event_photo.binary_data, content_type: @event_photo.content_type, file_name: @event_photo.file_name }
    assert_redirected_to event_photo_path(assigns(:event_photo))
  end

  test "should destroy event_photo" do
    assert_difference('EventPhoto.count', -1) do
      delete :destroy, id: @event_photo
    end

    assert_redirected_to event_photos_path
  end
end
