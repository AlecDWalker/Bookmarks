feature 'Add a bookmark' do

  scenario 'I can add a bookmark to my list of bookmarks and then see the whole list' do
    visit('/bookmarks')
    fill_in('url', with: "www.test.com")
    click_button 'Add Bookmark'
    expect(page).to have_content ('www.test.com')
  end

end
