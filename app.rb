require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      currentShips = params[:pirate][:ships].map do |ship|
        Ship.new(ship)
      end
      @ship1 = currentShips[0]
      @ship2 = currentShips[-1]

      erb :'pirates/show'
    end
  end
end
