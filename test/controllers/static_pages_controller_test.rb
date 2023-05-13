require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @app_name = "aqua.rb"
  end

  test "should get Root" do
    get root_url
    assert_response :success
    assert_select "title", @app_name
  end

  test "should get Home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", @app_name
  end

  test "should get Help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@app_name}"
  end

  test "should get About" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@app_name}"
  end

  test "should get Contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@app_name}"
  end
end
