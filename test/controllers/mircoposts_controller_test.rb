require 'test_helper'

class MircopostsControllerTest < ActionDispatch::IntegrationTest
	def setup
		@mircopost = mircoposts(:orange)
	end

	test "should redirect create when not logged in" do
		assert_no_difference 'Mircopost.count' do
			post mircoposts_path, params: { mircopost: { content: "axay"}}		
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
    assert_no_difference 'Mircopost.count' do
      delete mircopost_path(@mircopost)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:vishal))
    mircopost = mircoposts(:ants)
    assert_no_difference 'Mircopost.count' do
      delete mircopost_path(mircopost)
    end
    assert_redirected_to root_url
  end
end
