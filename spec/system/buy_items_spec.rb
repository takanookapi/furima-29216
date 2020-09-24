require 'rails_helper'

def visit_with_http_auth(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end


RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @buy_item = FactoryBot.build(:buy_item)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit_with_http_auth root_path
      expect(page).to have_content('新規登録')
    end
  end
end
