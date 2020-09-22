require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @report = reports(:report_1)
    @user = users(:user_2)
    sign_in @user
  end

  test '日報一覧を表示する' do
    visit reports_path
    assert_selector 'h1', text: '日報一覧'
    assert_selector 'td', text: 'report1_title'
  end

  test '日報を作成する' do
    visit reports_path
    click_on '新規作成'

    fill_in '題名', with: 'new_report_title'
    fill_in '内容', with: 'new_report_content'
    click_on '登録する'

    assert_text '作成しました。'
  end

  test '日報の詳細を表示する' do
    visit report_path(@report)
    assert_selector 'h1', text: '日報詳細'
    assert_text 'report1_title'
    assert_text 'report1_content'
  end

  test '日報を更新する' do
    visit reports_path
    click_on '編集', match: :first

    fill_in '題名', with: 'update_report1_title'
    fill_in '内容', with: 'update_report1_content'
    click_on '更新する'

    assert_text '更新しました。'
  end

  test '日報を削除する' do
    visit reports_path
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '削除しました。'
  end
end
