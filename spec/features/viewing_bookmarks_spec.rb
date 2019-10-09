feature 'Viewing bookmarks' do

  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all software');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

    visit '/bookmarks'

    expect(page).to have_content "Makers"
    expect(page).to have_content "Destroy all software"
    expect(page).to have_content "Google"
  end
end
