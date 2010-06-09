class Api < Sinatra::Base
  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end
  use Rack::CommonLogger

  get '/' do
    haml :form
  end
end
