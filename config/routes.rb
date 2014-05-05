CoordsToWeather::Application.routes.draw do
  post("/weather", { :controller => "coords", :action => "fetch_weather", :id => "name" })
  get("/weather", { :controller => "coords", :action => "fetch_weather", :id => "name" })
end
