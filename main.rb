require 'sinatra'
require 'sinatra/reloader' if development?

get "/" do
    @title = "Jane Hammond"
    @description = "This site showcases all of the awesome things that Tim Regan-Porter has done."
    @image = "img/home-bg.jpg"
    erb :home
end

get "/resume" do
    @title = "Jane Hammond"
    @description = "This site showcases all of the awesome things that Tim Regan-Porter has done."
    @image = "img/home-bg.jpg"
    erb :resume
end

get "/about" do
    @title = "Jane Hammond"
    @description = "This site showcases all of the awesome things that Tim Regan-Porter has done."
    @image = "img/about-bg.jpg"
    erb :about
end

get "/socialmedia" do
    @title = "Follow me"
    @description = "Check out my Twitter and Instagram APIs."
    @image = "img/post-bg.jpg"
    erb :socialmedia
end

get "/contact" do
    @title = "Contact me"
    @description = "Let's chat."
    @image = "img/contact-bg.jpg"
    erb :contact
end