require 'test_helper'

class PlaylistClipsControllerTest < ActionController::TestCase
  setup do
    @playlist_clip = playlist_clips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playlist_clips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playlist_clip" do
    assert_difference('PlaylistClip.count') do
      post :create, playlist_clip: @playlist_clip.attributes
    end

    assert_redirected_to playlist_clip_path(assigns(:playlist_clip))
  end

  test "should show playlist_clip" do
    get :show, id: @playlist_clip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playlist_clip
    assert_response :success
  end

  test "should update playlist_clip" do
    put :update, id: @playlist_clip, playlist_clip: @playlist_clip.attributes
    assert_redirected_to playlist_clip_path(assigns(:playlist_clip))
  end

  test "should destroy playlist_clip" do
    assert_difference('PlaylistClip.count', -1) do
      delete :destroy, id: @playlist_clip
    end

    assert_redirected_to playlist_clips_path
  end
end
