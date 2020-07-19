require 'test_helper'

class StaticHomeTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    log_in_as(@user)
  end
  
  test "home should include following and followers with login" do
    get root_path
    assert_select 'strong', { id: 'following', text: /#{@user.following.count.to_s}/ }
    assert_select 'strong', { id: 'followers', text: /#{@user.followers.count.to_s}/ }
  end
end
