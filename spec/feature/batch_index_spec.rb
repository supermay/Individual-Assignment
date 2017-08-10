require 'rails_helper'

sleep_seconds = 0.5

feature 'Batch Index Page', js: true do
  scenario 'create a batch' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    sleep sleep_seconds
    fill_in 'batch_number' , with: '3'
    sleep sleep_seconds
    fill_in "batch_start_at" , with: '10/01/2017'
    sleep sleep_seconds
    fill_in "batch_end_at" , with: '10/31/2017'
    sleep sleep_seconds
    click_on 'Save'
    sleep sleep_seconds
    expect(page).to have_content('Batch # 3','2017-10-01 to 2017-10-31','Not added any student yet')
  end

  scenario 'search a batch' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    fill_in 'number', with: '2'
    sleep sleep_seconds
    click_on 'Search'
    sleep sleep_seconds
    expect(page).to have_content('Batch # 2')
    expect(page).not_to have_content('Batch # 1')
  end

  scenario 'Click batch and redirect to the batch show page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    sleep sleep_seconds
    click_on 'Batch # 1'
    sleep sleep_seconds
    expect(page.current_path).to eq batch_path(1)
    expect(page.current_path).not_to eq batch_path(2)
    sleep sleep_seconds
  end

end
