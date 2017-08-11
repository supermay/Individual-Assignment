require 'rails_helper'

sleep_seconds = 2

feature 'Evaluation', js: true do
  scenario 'click name redirect to evaluation page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(1)
    sleep sleep_seconds
    click_on "Fan Ta"
    sleep sleep_seconds
    expect(page.current_path).to eq batch_student_path(1,3)
  end

  scenario 'click picture redirect to evaluation page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(1)
    sleep sleep_seconds
    find("img[src='http://oolongteauk.co.uk/images/logo.png']").click
    sleep sleep_seconds
    expect(page.current_path).to eq batch_student_path(1,6)
  end

  scenario 'Evaluation form default date is today' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_student_path(2,7)
    sleep sleep_seconds
    # This is to select the color.
    expect(page.find_by_id('evaluation_time').value).to eq Date.today.to_s
  end

  scenario 'add a new evaluation, redirected to batch show page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_student_path(2,7)
    sleep sleep_seconds
    # This is to select the color.
    page.find_by_id('evaluation_color').find("option[value='GREEN']").select_option
    click_on 'Save'
    sleep sleep_seconds
    expect(page.current_path).to eq batch_path(2)
    sleep sleep_seconds
  end

  scenario 'save and next' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    student1 = FactoryGirl.create(:student)
    student2 = Student.create!(first_name:"Dan", last_name:"Non",picture:"https://www.paxata.com/wp-content/uploads/dannon_transparent.png", batch_id: 2)
    visit batch_student_path(2,7)
    sleep sleep_seconds

    page.find_by_id('evaluation_color').find("option[value='GREEN']").select_option
    click_on 'Save and Next'
    sleep sleep_seconds
    expect(page.current_path).to eq batch_student_path(2,8)
    sleep sleep_seconds

    page.find_by_id('evaluation_color').find("option[value='YELLOW']").select_option
    click_on 'Save and Next'
    sleep sleep_seconds
    expect(page.current_path).to eq batch_student_path(2,9)

    page.find_by_id('evaluation_color').find("option[value='RED']").select_option
    click_on 'Save and Next'
    sleep sleep_seconds
    expect(page.current_path).to eq batch_student_path(2,7)
  end
  #
  # scenario 'can only fill in one evaluation per student per day' do
  #   user = FactoryGirl.create(:user)
  #   evaluation = FactoryGirl.create(:evaluation)
  #   login_as(user, :scope => :user)
  #   visit batch_student_path(2,7)
  #   sleep sleep_seconds
  #   fill_in("evaluation_time",with: "2017-08-10", exact: true)
  #   page.find_by_id('evaluation_color').find("option[value='GREEN']").select_option
  #   click_on 'Save'
  #   sleep sleep_seconds
  #   expect(page.current_path).to eq batch_student_path(2,7)
  #   expect(page.current_path).not_to eq batch_path(2)
  #   sleep sleep_seconds
  # end
  scenario 'select a day' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_student_path(1,4)
    sleep sleep_seconds
    find("#dropdownMenu1").click
    sleep sleep_seconds
    click_on "2017-08-09"
    sleep sleep_seconds
  end

end
