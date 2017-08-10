require 'rails_helper'

feature 'Batch Index Page', js: true do
  scenario 'create a new batch' do
    user = FactoryGirl.create(:user)
    batch = FactoryGirl.create(:batch)
    login_as(user, :scope => :user)
    # Point your browser towards the todo path
    visit root_path
    sleep 10
    # # Enter description in the text field
    fill_in 'Number', with: '1'
    #
    # # Press enter (to submit the form)
    # page.execute_script("$('form').submit()")
    #
    # # Expect the new task to be displayed in the list of tasks
    # expect(page).to have_content('Be Batman')
  end
end
