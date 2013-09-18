get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/:short_url' do 
  @url = Url.where(short_url: params[:short_url]).first
  @url.counter += 1
  @url.save  
  redirect "http://#{@url.original_url}"
end 


post '/' do 
  short = Url.random
  @url = Url.create(original_url: params[:original_url], short_url: short, counter: 0)
  if @url.valid?
  erb :newurl 
  else
  erb :notvalid 
  end 
end 
