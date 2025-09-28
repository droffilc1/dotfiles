#!/usr/bin/env python3

import requests
import json
import sys


def get_weather():
    try:
        # Using wttr.in for weather data (no API key required)
        # You can change the location by modifying the URL
        response = requests.get("https://wttr.in/Nairobi?format=j1", timeout=10)

        if response.status_code == 200:
            data = response.json()

            current = data["current_condition"][0]
            temp = current["temp_C"]
            desc = current["weatherDesc"][0]["value"]
            humidity = current["humidity"]
            wind_speed = current["windspeedKmph"]

            # Weather icon mapping
            weather_icons = {
                "Sunny": "☀️",
                "Clear": "🌙",
                "Partly cloudy": "⛅",
                "Cloudy": "☁️",
                "Overcast": "☁️",
                "Mist": "🌫️",
                "Fog": "🌫️",
                "Light rain": "🌦️",
                "Moderate rain": "🌧️",
                "Heavy rain": "⛈️",
                "Light snow": "🌨️",
                "Heavy snow": "❄️",
                "Thunderstorm": "⛈️",
            }

            icon = weather_icons.get(desc, "🌡️")

            output = {
                "text": f"{icon} {temp}°C",
                "tooltip": f"{desc}\nTemperature: {temp}°C\nHumidity: {humidity}%\nWind: {wind_speed} km/h",
                "class": "weather",
            }

            print(json.dumps(output))

        else:
            # Fallback when API is unavailable
            fallback = {
                "text": "🌡️ --°C",
                "tooltip": "Weather data unavailable",
                "class": "weather-unavailable",
            }
            print(json.dumps(fallback))

    except Exception as e:
        # Error fallback
        error_output = {
            "text": "🌡️ --°C",
            "tooltip": f"Weather error: {str(e)}",
            "class": "weather-error",
        }
        print(json.dumps(error_output))


if __name__ == "__main__":
    get_weather()
