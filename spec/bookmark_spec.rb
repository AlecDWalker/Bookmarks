require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.add_bookmark(url: "http://www.makersacademy.com" , title: "Makers")
      Bookmark.add_bookmark(url: "http://www.destroyallsoftware.com" , title: "Destroy all software")
      Bookmark.add_bookmark(url: "http://www.google.com" , title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.first.title).to eq("Makers")
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
end
