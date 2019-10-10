require 'pg'
require 'database_connection'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks')
    result.map { |bookmark|
    Bookmark.new(bookmark['id'],bookmark['url'], bookmark['title'])
  }
  end

  def self.add_bookmark(url:, title:)
    bookmark = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')RETURNING id, url, title;").first
    Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end

end
