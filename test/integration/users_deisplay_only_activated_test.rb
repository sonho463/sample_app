require 'test_helper'

# unactivated:
#   name: Un Activated
#   email: unactivated@example.gov
#   password_digest: <%= User.digest('password') %>
#   activated: false
#   activated_at: nil


class UsersDeisplayOnlyActivatedTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @active = users(:michael)
    @unactivated = users(:unactivated)
  end
  
  # users/indexにアクセスしてユーザー数をカウント
  # unactivatedを有効化
  # users/indexを更新してユーザー数をカウント　＋１
  test "don't display users index to unactivated user" do
    log_in_as(@active)
    get users_path
    @users = assigns(:users)
    delete logout_path 
    
    assert_difference '@users.count', 1 do
      @unactivated.activate
      log_in_as(@unactivated)
      get users_path
      @users = assigns(:users)
    end
  end
  
  test "Don't display show page to unactivated user" do
    log_in_as(@unactivated)
    get user_path(@unactivated)
    assert_redirected_to root_url
  end

  
  

end
