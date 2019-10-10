feature 'Add a bookmark' do

  scenario 'I can add a bookmark to my list of bookmarks and then see the whole list' do
    visit('/bookmarks')
    fill_in('url', with: "http://www.test.com")
    fill_in('title', with: "Test")
    click_button 'Add Bookmark'
    expect(page).to have_content ('Test')
  end

  scenario 'I get an error message if entered URL is invalid' do
    visit '/bookmarks'
    fill_in('url', with: "hello")
    fill_in('title', with: "Hello")
    click_button 'Add Bookmark'
    expect(page).not_to have_content ('Hello')
    expect(page).to have_content ('You must submit a valid URL')
  end

end
