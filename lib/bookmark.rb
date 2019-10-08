require 'pg'

class Bookmark

  def self.all
    connection = Bookmark.choose_connection
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add_bookmark(url, title)
    connection = Bookmark.choose_connection
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');")
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
