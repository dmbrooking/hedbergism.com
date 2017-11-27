Bundler.require :web
Bundler.require :development if development?

require_relative 'lib/hedbergism/quotes'

filename = File.join(File.dirname(__FILE__), 'data/quotes.csv')
quotes = Hedbergism::Quotes.new(filename: filename)

get '/style.css' do
  scss :style
end

get '/' do
  quote, index = quotes.random
  permalink = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/#{index}"

  haml :index, locals: { quote: quote, permalink: permalink }
end

get '/:id' do |id|
  quote = quotes.quote(id.to_i)

  haml :index, locals: { quote: quote, permalink: request.url }
end

not_found do
  haml :'404'
end
