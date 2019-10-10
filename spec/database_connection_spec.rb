require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'can connect to a database when passed the name as an argument' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      described_class.setup('bookmark_manager_test')
    end
  end

  describe '.query' do
    it 'can execute an SQL query string on the relevant database' do
    connection = described_class.setup('bookmark_manager_test')
    expect(connection).to receive(:exec).with('SELECT * FROM bookmarks')
    described_class.query('SELECT * FROM bookmarks')
  end
  end
end
