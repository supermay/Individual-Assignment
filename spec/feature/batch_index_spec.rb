require 'rails_helper'

feature 'Batch Index Page', js: true do
  scenario 'create a batch' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    batch = FactoryGirl.create(:batch,user: user)
    batch.save!

    visit root_path
    sleep 2
    fill_in 'batch_number' , with: '23'
    fill_in "batch_start_at" , with: '08/01/2017'
    fill_in "batch_end_at" , with: '08/31/2017'
    sleep 2
    click_on 'Save'
    sleep 2
    expect(page).to have_content('Batch # 23','2017-08-01 to 2017-08-31','Not added any student yet')
    # put it separate or together?
    sleep 2
    fill_in 'number', with: '23'
    click_on 'Search'
    sleep 2
    expect(page).to have_content('Batch # 23')
    expect(page).not_to have_content('Batch # 100')
    sleep 2

    click_on 'Batch # 23'
    sleep 2

  end

  # scenario 'search a batch' do
  #   user = FactoryGirl.create(:user)
  #   login_as(user, :scope => :user)
  #   batch1 = FactoryGirl.create(:batch)
  #   batch1.user = user
  #   batch1.save!
  #
  #   batch2 = FactoryGirl.create(:batch,number:"23")
  #   batch2.user = user
  #   batch2.save!
  #
  #   visit root_path
  # end

end
