//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Lê Tiến Đạt on 20/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Hà Nội, VN")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 37)
                
                HStack(spacing: 20) {
                    WeatherDayView( dayOfWeek: "T2",
                                    imageName: "sun.max.fill",
                                    temperature: 37)
                    
                    WeatherDayView( dayOfWeek: "T3",
                                    imageName: "cloud.drizzle.fill",
                                    temperature: 20)
                    
                    WeatherDayView( dayOfWeek: "T4",
                                    imageName: "cloud.bolt.rain.fill",
                                    temperature: 15)
                    
                    WeatherDayView( dayOfWeek: "T5",
                                    imageName: "wind",
                                    temperature: 7)
                    
                    WeatherDayView( dayOfWeek: "T6",
                                    imageName: "smoke.fill",
                                    temperature: 25)
                }
                
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                }) {
                    Spacer()
                    Text("Change Day Time")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.blue)
                        .padding(15)
                    Spacer()
                }
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 30)
                
                Spacer()
                    .frame(height: 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            colors: [isNight ? .black : .blue, isNight ? .gray : .white],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .foregroundColor(.white)
            .font(.system(size: 32, weight: .medium))
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
