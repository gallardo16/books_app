require "application_system_test_case"

class UserFollowsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user1 = users(:user_1)
    @user2 = users(:user_2)
  end

  test 'ユーザーをフォローする' do
    sign_in @user2
    visit user_path(@user1)
    click_on 'フォローする'
    assert_equal @user1, @user2.followings.first
  end

  test 'ユーザーをフォロー解除する' do
    sign_in @user1
    visit user_path(@user2)
    click_on 'フォロー解除'
    assert_empty @user1.followings
  end
end
