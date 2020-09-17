require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user1= users(:user_1)
    @user2= users(:user_2)
  end

  test 'githubのoauth認証より登録済みユーザー情報を取得' do
    auth = OmniAuth::AuthHash.new(
      uid: '1',
      provider: 'github',
      info: {
        name: 'user_1',
        email: 'user11@example.com'
      }
    )
    auth_user = User.find_for_github_oauth(auth)
    assert @uesr1 == auth_user
  end

  test 'フォローされていると真を返す' do
    assert @user2.following?(@user1)
  end
end
