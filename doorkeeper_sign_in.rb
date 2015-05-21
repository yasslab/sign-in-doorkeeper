require 'pry'

require 'capybara'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.run_server = false

RSpec.describe 'Doorkeeperにサインインできる', js: true do
  let(:doorkeeper_id)       { ENV['DOORKEEPER_ID'] }
  let(:doorkeeper_password) { ENV['DOORKEEPER_PASSWORD'] }

  include Capybara::DSL
  specify 'Doorkeeperにサインインする' do
    visit 'https://doorkeeper.jp/'
    click_on('ログイン')
    fill_in 'メールアドレス', doorkeeper_id
    fill_in 'パスワード', doorkeeper_password
    within('.simple_form') do
      click_on 'ログイン'
    end
    within('.panel') { click_on 'コミュニティ名' }
  end
end
