# clima

A weather application for assignment project of SoluLab. It fetch data from OpenWeatherMap and shows weather condition of user location as well as of desired locations.

## Description 

This Flutter application fetch data form OpenWeatherMap API and show following data:
- Temperature
- Humidity
- Wind Speed
- Sky Condition
- One Suggestion based on weather condition

This Flutter Application:
- Get user location via Geolocator plugin
- Fetch weather data of user's latitude and longitude
- Fetch weather data of user's entered location

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Video](#video)
- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- Get user location
- Show user's location weather data
- Show weather data of city name entered by user
- Show error message if internet connection is not proper
- Show error message if the entered city name does not exist

## Screensort

![Screenshot 1](screenshot/1.jpeg)
![Screenshot 2](screenshot/2.jpeg)
![Screenshot 3](screenshot/3.jpeg)
![Screenshot 4](screenshot/4.jpeg)

# Video

![Video](video/video.mp4)

## Installation

Follow these steps to set up and run the project locally.

1. **Clone the repository**:
    ```
    git clone https://github.com/ommishraji/weather_app
    ```

2. **Install dependencies**:
    ```
    flutter pub get
    ```

3. **Set up your Android and iOS configurations**:
    - For Android, ensure you have the necessary permissions in `AndroidManifest.xml`.
    - For iOS, add necessary configurations in `Info.plist`.

4. **Run the application**:
    ```
    flutter run
    ```

## Usage

1. Open the application
2. It will ask location permission
3. Give location permission
4. The app will show weather data of your location 
5. Click on city icon in top right corner
6. Enter city name
7. The app will show weather condition of entered location

## API Reference

The app fetches posts from the following API:
- OpenWeatherMap API via latitude and longitude
- OpenWeatherMap API via city name