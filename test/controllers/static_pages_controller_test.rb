require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @app_name = "aqua.rb"
  end

  test "should get Root" do
    get root_path
    assert_response :success
    assert_select "title", @app_name
  end

  test "should get Home" do
    get top_path
    assert_response :success
    assert_select "title", @app_name
  end

  test "should get Help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@app_name}"
  end

  test "should get About" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@app_name}"
  end

  test "should get Contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@app_name}"
  end
end
