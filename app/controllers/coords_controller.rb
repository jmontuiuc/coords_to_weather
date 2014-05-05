require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @address = "San Diego, CA"
    addy = params[:name]
    @address = "#{addy}"
    @url_safe_address = URI.encode(@address)
    @your_api_key = "46841f6d070b50ef7d2d0e0e1e35f677"

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    results = parsed_data["results"]
    first = results[0]
    geometry = first["geometry"]
    location = geometry["location"]
    @latitude = location["lat"]
    @longitude = location["lng"]

    # Your code goes here.
    url2= "https://api.forecast.io/forecast/#{@your_api_key}/#{@latitude},#{@longitude}"
    raw_data2 = open(url2).read
    parsed_data2 = JSON.parse(raw_data2)
    current=parsed_data2["currently"]
    minute=parsed_data2["minutely"]
    hour=parsed_data2["hourly"]
    daily=parsed_data2["daily"]
    @temperature = current["temperature"]
    @minutely_summary = minute["summary"]
    @hourly_summary = hour["summary"]
    @daily_summary = daily["summary"]
  end
end
