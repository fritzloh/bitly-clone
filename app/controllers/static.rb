
require_relative '../models/url'

get '/' do
  @url = Url.last if Url.last
  
  erb :"static/index"
end

post '/urls' do 
    x = Url.create(long_url: params["long_url"])
    x.shorten
    if x.save
     then
    redirect to('/')
else
	erb :"static/error"
end
end


get '/:shortened' do
  url = Url.find_by(short_url: params[:shortened])
  url.click_count += 1
  url.save
  redirect to "#{url.long_url}"
end
