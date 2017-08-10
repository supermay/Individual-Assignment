require 'rails_helper'

sleep_seconds = 0.5

feature 'Batch Show Page', js: true do
  scenario 'add a student to the batch' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(1)
    sleep sleep_seconds
    fill_in 'student_first_name' , with: 'Lip'
    sleep sleep_seconds
    fill_in "student_last_name" , with: 'Ton'
    sleep sleep_seconds
    fill_in "student_picture" , with: 'https://vignette4.wikia.nocookie.net/logopedia/images/1/1e/Lipton-logo.png/revision/latest?cb=20150201084619'
    sleep sleep_seconds
    click_on 'Save'
    sleep sleep_seconds
    expect(page).to have_content('Lip Ton')
    expect(page).to have_xpath("//img[@src='https://vignette4.wikia.nocookie.net/logopedia/images/1/1e/Lipton-logo.png/revision/latest?cb=20150201084619']")

    click_on 'Home'
    sleep sleep_seconds
    expect(page).to have_content('7 students')
    expect(page).not_to have_content('6 students')
  end

end
