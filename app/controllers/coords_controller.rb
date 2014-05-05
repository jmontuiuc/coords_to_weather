require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 42.0538387
    @longitude = -87.67721
    @your_api_key = "46841f6d070b50ef7d2d0e0e1e35f677"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/#{@your_api_key}/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    current=parsed_data["currently"]
    minute=parsed_data["minutely"]
    hour=parsed_data["hourly"]
    daily=parsed_data["daily"]
    @temperature = current["temperature"]
    @minutely_summary = minute["summary"]
    @hourly_summary = hour["summary"]
    @daily_summary = daily["summary"]
  end
end
