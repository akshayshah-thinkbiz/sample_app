require 'test_helper'

class MircopostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:vishal)
  end

  test "mircopost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Mircopost.count' do
      post mircoposts_path, params: { mircopost: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This mircopost really ties the room together"
    assert_difference 'Mircopost.count', 1 do
      post mircoposts_path, params: { mircopost: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_mircopost = @user.mircoposts.paginate(page: 1).first
    assert_difference 'Mircopost.count', -1 do
      delete mircopost_path(first_mircopost)
    end
    # Visit different user (no delete links)
    get user_path(users(:vishal))
    assert_select 'a', text: 'delete', count: 0
  end

  test "mircopost sidebar count" do
    log_in_as(@user)
    get root_path
    assert_match "#{@user} mircoposts", response.body
    # User with zero microposts
    other_user = users(:Akshay)
    log_in_as(other_user)
    get root_path
    assert_match "0 mircoposts", response.body
    other_user.mircoposts.create!(content: "A mircopost")
    get root_path
    assert_match content, response.body
  end
end
