import json
import requests
import datetime

time_emoji = ["🕛","🕐","🕑","🕒","🕓","🕔","🕕","🕖","🕗","🕘","🕙","🕚"]
weather_emoji = {"clouds":"☁","clear":"☼","rain":"☂","thunderstorm":"⚡","snow":"❅","mist":"🌂"}

response = requests.get("https://api.openweathermap.org/data/2.5/onecall?lat=35.6914&lon=139.5011&exclude=daily&units=metric&appid=cda6b6d04aff0e0e2ed36e07b20ef26d&lang=en")
weather_data = response.json()
i = 1
for weather in weather_data["hourly"]:
  unix_time = weather["dt"]
  time_in_JST = datetime.datetime.utcfromtimestamp(unix_time) + datetime.timedelta(hours=9)
  time = int(time_in_JST.strftime("%H")) if int(time_in_JST.strftime("%H")) < 12 else int(time_in_JST.strftime("%H")) - 12
  weather_dsc = weather["weather"][0]["description"]
  for key in weather_emoji.keys():
    if key in weather_dsc:
      icon = weather_emoji[key]
  if i % 6 == 0:
    print(f"{time_emoji[time]} : {icon}")
  else:
    print(f"{time_emoji[time]} : {icon} | ",end = "")
  i += 1
