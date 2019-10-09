require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    connection = Bookmark.choose_connection
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark|
    Bookmark.new(bookmark['id'],bookmark['url'], bookmark['title'])
  }
  end

  def self.add_bookmark(url:, title:)
    connection = Bookmark.choose_connection
    bookmark = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')RETURNING id, url, title;").first
    Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
  end

  private

  def self.choose_connection
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'bookmark_manager_test')
    else
      return PG.connect(dbname: 'bookmark_manager')
    end
  end

end
