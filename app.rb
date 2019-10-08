require 'sinatra/base'

class BookMarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  run! if app_file == $0

end
