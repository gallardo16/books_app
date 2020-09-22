require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user_1)
    sign_in @user
  end

  test 'ユーザー一覧ページを表示する' do
    visit users_path
    assert_selector 'h1', text: 'ユーザー一覧'
    assert_text 'user1'
    assert_text 'user2'
  end

  test 'ユーザー詳細ページを表示する' do
    visit user_path(@user)
    assert_selector 'h1', text: 'プロフィール'
    assert_text 'user1'
    assert_text 'user1@example.com'
    assert_text '1234567'
    assert_text 'sample123'
  end

  test 'プロフィールを編集する' do
    visit user_path(@user)
    click_on 'プロフィール編集'

    fill_in '名前', with: 'update_user1'
    fill_in 'Eメール', with: 'update_user1@example.com'
    fill_in '郵便番号', with: '1234561'
    fill_in '住所', with: 'update_sample123'
    fill_in '自己紹介', with: 'new_user1_selfintroduce'
    click_on '更新'

    assert_current_path user_path(@user)
    assert_text 'update_user1'
    assert_text 'update_user1@example.com'
    assert_text '1234561'
    assert_text 'update_sample123'
    assert_text 'new_user1_selfintroduce'
  end
end
