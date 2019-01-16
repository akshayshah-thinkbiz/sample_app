require 'test_helper'

class MircopostTest < ActiveSupport::TestCase
  
 def setup
  	@user = users(:vishal)
  	#this code is not idomatically correct
  	@mircopost = @user.mircoposts.build(content: "axay")
 end 

 test "should be valid" do 
 	assert @mircopost.valid?
 end

 test "user id should be present" do
 	@mircopost.user_id = nil
 	assert_not @mircopost.valid?
 end

 test "content should be present" do
 	@mircopost.content = " "
 	assert_not @mircopost.valid?
 end

 # test "content should be at most 140 character" do
 # 	@mircopost.content = "a" * 140
 # 	assert_not @mircopost.valid?
 # end 

 test "order should be most recent first" do
 	assert_equal mircoposts(:most_recent), Mircopost.first
 end
end

