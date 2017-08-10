require 'rails_helper'

feature 'Batch Index Page', js: true do
  scenario 'create a new batch' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    # Point your browser towards the todo path
    visit root_path
    sleep 2
    # # Enter description in the text field
    fill_in 'Number', with: '1'
    sleep 2

    # # Expect the new task to be displayed in the list of tasks
    # expect(page).to have_content('Be Batman')
  end
end
