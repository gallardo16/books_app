require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @book = books(:book_1)
    @user = users(:user_1)
    sign_in @user
  end

  test '投稿された書籍一覧を表示する' do
    visit books_path
    assert_selector 'h1', text: '書籍一覧'
    assert_selector 'td', text: 'book1_title'
  end

  test '書籍を作成する' do
    visit books_path
    click_on '新規作成'

    fill_in '題名', with: 'new_book_title'
    fill_in '説明', with: 'new_book_description'
    fill_in '著者', with: 'new_book_author'
    click_on '登録する'

    assert_text '作成しました。'
  end

  test '投稿された書籍の詳細を表示する' do
    visit book_path(@book)
    assert_selector 'h1', text: '書籍詳細'
    assert_text 'book1_title'
    assert_text 'book1_memo'
    assert_text 'book1_author'
  end

  test '書籍を更新する' do
    visit books_path
    click_on '編集', match: :first

    fill_in '題名', with: 'update_book1_title'
    fill_in '説明', with: 'update_book1_description'
    fill_in '著者', with: 'update_book1_author'
    click_on '更新する'

    assert_text '更新しました。'
  end

  test '書籍を削除する' do
    visit books_path
    page.accept_confirm do
      click_on "削除", match: :first
    end

    assert_text "削除しました。"
  end
end
