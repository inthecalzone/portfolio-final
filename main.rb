require 'sinatra'
require 'sinatra/reloader' if development?

get "/" do
    @title = "Jane Hammond"
    @description = "This site showcases all of the awesome things that Jane Hammond has done."
    @image = "img/home-bg.jpg"
    erb :home
end

get "/resume" do
    @title = "Work experience"
    @description = "This page showcases Jane Hammond's awesome resume."
    @image = "img/resume-bg.jpg"
    erb :resume
end

get "/about" do
    @title = "All about me"
    @description = "This page shows how awesome Jane Hammond is as a person."
    @image = "img/about-bg.jpg"
    erb :about
end

get "/socialmedia" do
    require 'twitter'
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ZwykevXtgmHlBtbxtvAjNBeal"
      config.consumer_secret     = "yJqtZIc3bZfJAOWmNbCPvrPEZJXPEqtNU1d5Q6YGYushUPjOLl"
      config.access_token        = "154367271-CrtVcdbvBgqkaZD3NIV0waADZ09gd0NH6GzZxMVX"
      config.access_token_secret = "DLpWn3c2N0rgm9G9sGqepJkQgra5yQqBgfjVbZ79qIkJt"
    end

    @search_results = client.user_timeline("@inthecalzone").take(15).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
        tweet
    end
    
    require "sinatra"
    require "instagram"

    #enable :sessions

    CALLBACK_URL = "http://localhost:4567/oauth/callback"

    Instagram.configure do |config|
      config.client_id = "e6ec439e44c64f18b1754e6d13d3980b"
      config.client_secret = "f8a321661be94c9b82ee41f10d079013"
      # For secured endpoints only
      #config.client_ips = '<Comma separated list of IPs>'
    end
    

    
    @ig_results = [] 
      client = Instagram.client(:access_token => session[:access_token])
      for media_item in client.user_recent_media(16964038)
                @ig_results.push(media_item) 

      end





    
    @title = "Follow me"
    @description = "Check out my Twitter and Instagram APIs."
    @image = "img/socialmedia-bg.jpg"
    erb :socialmedia
end

get "/contact" do
    @title = "Contact me"
    @description = "Let's chat."
    @image = "img/contact-bg.jpg"
    erb :contact
end