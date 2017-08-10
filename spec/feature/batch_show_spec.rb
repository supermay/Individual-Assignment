require 'rails_helper'

sleep_seconds = 0.5

feature 'Batch Show Page', js: true do
  scenario 'add a student to the batch' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(2)
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
    # just to make sure that batch #2 doesn't have student from batch #1
    # maybe putting here is not so proper.
    expect(page).not_to have_content('Coca Cola')
    expect(page).not_to have_xpath("//img[@src='https://www.cocacola.nl/content/dam/GO/CokeZone/Common/global/logo/logodesktop/coca-cola-logo-260x260.png']")

    click_on 'Home'
    sleep sleep_seconds
    expect(page).to have_content('2 students')
    expect(page).not_to have_content('1 students')
  end

  scenario 'edit a student of the batch' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(2)
    sleep sleep_seconds
    click_on 'Edit'
    expect(page.current_path).to eq edit_batch_student_path(2,7)
    sleep sleep_seconds
    fill_in 'student_first_name', with: 'Nest'
    sleep sleep_seconds
    fill_in 'student_last_name', with: 'Le'
    sleep sleep_seconds
    fill_in 'student_picture', with: 'https://seeklogo.com/images/N/Nestle-logo-5A0FB4B531-seeklogo.com.png'
    click_on 'Save'
    sleep sleep_seconds

    expect(page).to have_content('Nest Le')
    expect(page).to have_xpath("//img[@src='https://seeklogo.com/images/N/Nestle-logo-5A0FB4B531-seeklogo.com.png']")

    expect(page).not_to have_content('Douwe Egberts')
    expect(page).not_to have_xpath("//img[@src='http://www.peppermintmedia.nl/wp-content/uploads/2015/02/Douwe-Egberts_logo_video.png']")
  end

  scenario 'delete a student from the batch' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(2)
    sleep sleep_seconds
    click_on 'Delete'
    sleep sleep_seconds
    text = page.driver.browser.switch_to.alert.text
    expect(text).to eq 'Are you sure?'
    page.driver.browser.switch_to.alert.accept
    sleep sleep_seconds
    expect(page).not_to have_content('Douwe Egberts')
    expect(page).not_to have_xpath("//img[@src='http://www.peppermintmedia.nl/wp-content/uploads/2015/02/Douwe-Egberts_logo_video.png']")
  end

  scenario 'filter student with latest evaluation "GREEN"' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(1)
    sleep sleep_seconds
    find("#dropdownMenu1").click
    sleep sleep_seconds
    click_on "GREEN"
    sleep sleep_seconds

    expect(page).to have_content('Coca Cola')
    expect(page).to have_content('Alp Ro')
    expect(page).not_to have_content('Heine Ken')
    expect(page).not_to have_content('Fan Ta')
    expect(page).not_to have_content('Star Bucks')
    expect(page).not_to have_content('Oo Long')
  end

  scenario 'filter student with latest evaluation "YELLOW"' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(1)
    sleep sleep_seconds
    find("#dropdownMenu1").click
    sleep sleep_seconds
    click_on "YELLOW"
    sleep sleep_seconds
    expect(page).to have_content('Heine Ken')
    expect(page).to have_content('Star Bucks')
    expect(page).not_to have_content('Fan Ta')
    expect(page).not_to have_content('Oo Long')
    expect(page).not_to have_content('Coca Cola')
    expect(page).not_to have_content('Alp Ro')
  end

  scenario 'filter student with latest evaluation "RED"' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(1)
    sleep sleep_seconds
    find("#dropdownMenu1").click
    sleep sleep_seconds
    click_on "RED"
    sleep sleep_seconds
    expect(page).to have_content('Fan Ta')
    expect(page).not_to have_content('Heine Ken')
    expect(page).not_to have_content('Star Bucks')
    expect(page).not_to have_content('Oo Long')
    expect(page).not_to have_content('Coca Cola')
    expect(page).not_to have_content('Alp Ro')
  end


end
