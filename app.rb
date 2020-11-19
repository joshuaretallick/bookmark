require 'sinatra/base'
require './lib/bookmark'
require_relative './database_connection_setup.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/update/:id' do
    @bookmarks = params[:id]
    erb :'bookmarks/update'
  end

  patch '/bookmarks/update/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end



  run! if app_file == $0

end
