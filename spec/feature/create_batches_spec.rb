require 'rails_helper'

feature 'Create batches', js: true do
  scenario 'create a new batch' do
    # Point your browser towards the todo path
    visit batches_path
    sleep 100
    # # Enter description in the text field
    # fill_in 'todo_title', with: 'Be Batman'
    #
    # # Press enter (to submit the form)
    # page.execute_script("$('form').submit()")
    #
    # # Expect the new task to be displayed in the list of tasks
    # expect(page).to have_content('Be Batman')
  end
end
