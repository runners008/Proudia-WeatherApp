# My Weather App (iOS)

The My Weather App is a mobile application designed to provide weather information for cities worldwide.

## Getting Started (How to Download)

To download and run the app, follow these steps:

1. Download the ZIP file containing the project.
2. Open Xcode by clicking on the .xcodeproj file.
3. Build and run the project using the keyboard shortcut cmd + R.

## About the Project

The My Weather App is developed using Swift and SwiftUI framework for the frontend. The project follows the MVVM (Model-View-ViewModel) software architecture.

### Development

The application is written in Swift, making use of SwiftUI for the user interface. The MVVM architectural pattern is employed to ensure a structured and scalable codebase.

### User Interface

The app consists of two main screens:

1. Current Weather Screen: Displays the current temperature and humidity of the selected city.
<img src="https://github.com/runners008/Proudia-WeatherApp/assets/57987228/e89ec82d-c30f-497e-8bd0-84b186f6b557" alt="Image 1" style="width: 200px;">
<img src="https://github.com/runners008/Proudia-WeatherApp/assets/57987228/33ddf79b-98ad-4163-9c59-5bf3eaca8c99" alt="Image 2" style="width: 200px;">
<img src="https://github.com/runners008/Proudia-WeatherApp/assets/57987228/600f57f7-e163-4f86-913f-29203b0d0580" alt="Image 3" style="width: 200px;">

This screen features the current temperature along with Humidity of the typed city. Also, color of the background changes when the weather condition change (eg. yellow for sunny, grey for clouds). Moreover, this screen can show the temperture both in celsius and ferrenheit.

2. Forecast Weather Screen: Provides a forecast of the weather conditions for the selected city.
<img src="https://github.com/runners008/Proudia-WeatherApp/assets/57987228/69b3153d-ade3-4b52-b580-58a61f0cc22f" alt="Image" style="width: 200px;">

This screen features the forecast temperature and condition of the typed city.

## Features

The My Weather App offers the following features:

- View the current temperature and humidity of any selected city.
- Access a forecast of the weather conditions for the chosen city.

## APIs

The app utilizes the API services provided by openweathermap.org to retrieve weather data.

- API for retrieving weather information: http://api.openweathermap.org/data/2.5/forecast?id=524901&appid={apikey}&q={cityName}&units={temperatureUnit}

Feel free to explore the app, check the weather for different cities, and stay informed about the current and forecasted weather conditions.

# Reccomendation
- Animated Background will make the app feels more interesting and beautiful to use.
- Provide more information such as the chance of rain, pressure, wind speed and direction.
- Allow to save the favorite cities.
- Make response data more informative such as representing the temperature of the day by using graphs.
