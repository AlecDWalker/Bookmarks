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
  describe '.create' do
    it 'does not create a bookmark if URL given is invalid' do
      bookmark = Bookmark.add_bookmark(url: 'hello', title: 'Hello')
      expect(Bookmark.all.length).to eq 0
    end
  end
  describe '.delete' do
    it 'deleted the selected bookmark' do
      bookmark = Bookmark.add_bookmark(title: 'Makers Academy', url: 'https://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.add_bookmark(title: "Makers Academy" , url: "http://www.makersacademy.com")
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end
  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.add_bookmark(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end
