require 'test_helper'
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
 

  test "should get home" do
    get root_path
    assert_response :success
    # assert_not :success, "SZSDSdasdasdas"
    assert_select "title", "Home | Ruby on Rails tutorial Sample App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    # assert_not :success, "SZSDSdasdasdas"
    assert_select "title", "Help | Ruby on Rails tutorial Sample App"
  end

  test "should get about" do
  	get about_path
  	assert_response :success
    # assert_not :success, "SZSDSdasdasdas"
  	assert_select "title", "About | Ruby on Rails tutorial Sample App"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    # assert_not :success, "SZSDSdasdasdas"
    assert_select "title", "Contact | Ruby on Rails tutorial Sample App"
  end
end
