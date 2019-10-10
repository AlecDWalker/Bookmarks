require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  return DatabaseConnection.setup('bookmark_manager_test')
else
  return DatabaseConnection.setup('bookmark_manager')
end
