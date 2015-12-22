
require_relative '../models/url'

get '/' do
  @urls = Url.last
  erb :"static/index"
end

post '/urls' do 
    x = Url.create(long_url: params["long_url"])
    x.shorten
    x.save
    redirect to('/')
end


get '/:shortened' do
  url = Url.find_by(short_url: params[:shortened])
  redirect to "#{url.long_url}"
end
