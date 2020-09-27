require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @book_comment = comments(:book_comment)
    @report_comment = comments(:report_comment)
    @book = books(:book_1)
    @report = reports(:report_1)
    @user1 = users(:user_1)
    @user2 = users(:user_2)
  end

  test '書籍のコメントを一覧表示する' do
    sign_in @user2
    visit book_path(@book)
    assert_selector 'h2', text: 'コメント'
    assert_selector 'td', text: '本のコメント'
  end

  test '書籍にコメントする' do
    sign_in @user2
    visit book_path(@book)
    click_on '新規作成'

    fill_in '内容', with: '書籍にコメントしたよ'
    click_on '登録する'
    assert_text '作成しました。'
  end

  test '書籍のコメントを編集する' do
    sign_in @user2
    visit book_path(@book)
    click_on '編集'

    fill_in '内容', with: 'update_book_comment'
    click_on '更新する'

    assert_text '更新しました。'
  end

  test '書籍のコメントを削除する' do
    sign_in @user2
    visit book_path(@book)
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '削除しました。'
  end

  test '日報のコメントを一覧表示する' do
    sign_in @user1
    visit report_path(@report)
    assert_selector 'h2', text: 'コメント'
    assert_selector 'td', text: '日報のコメント'
  end

  test '日報にコメントする' do
    sign_in @user1
    visit report_path(@report)
    click_on '新規作成'

    fill_in '内容', with: '日報にコメントしたよ'
    click_on '登録する'

    assert_text '作成しました。'
  end

  test '日報のコメントを編集する' do
    sign_in @user1
    visit report_path(@report)
    click_on '編集'

    fill_in '内容', with: 'update_report_comment'
    click_on '更新する'

    assert_text '更新しました。'
  end

  test '日報のコメントを削除する' do
    sign_in @user1
    visit report_path(@report)
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '削除しました。'
  end
end
