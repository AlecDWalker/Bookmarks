require 'sinatra/base'
require './lib/bookmark'

class BookMarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/add' do
    Bookmark.add_bookmark(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
