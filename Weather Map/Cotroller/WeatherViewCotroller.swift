//
//  WeatherViewCotroller.swift
//  Weather Map
//
//  Created by Hồ Bảo An on 09/02/2023.
//

import Foundation
import UIKit

class WeatherViewCotroller: UIViewController {
    
    let cityLabel = UILabel()
    let iconImage = UIImageView()
    let tempLabel = UILabel()
    let WindyImg = UIImageView()
    let humidityImg = UIImageView()
    let cloudImg = UIImageView()
    let humidityLabel = UILabel()
    let cloudLabel = UILabel()
    let WindyLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setDataWeather(cityName: cityName)
        
        setupIconImage()
        setupTempLabel()
        setupHumidityImg()
        setupCloudImg()
        setupWindyImg()
        setupHumidityLabel()
        setupCloudLabel()
        setupWindyLabel()
    }
    
    public func setDataWeather (cityName: String) {
        setupCityLabel(cityName: cityName)
    }
    
    func setupCityLabel(cityName: String) {
           cityLabel.text = cityName
           cityLabel.textAlignment = .center
           cityLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
           view.addSubview(cityLabel)
           
           cityLabel.translatesAutoresizingMaskIntoConstraints = false
           cityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
           cityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
           cityLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
       }
       
       func setupIconImage() {
           iconImage.image = UIImage(named: "weather.png")
           iconImage.contentMode = .scaleAspectFit
           view.addSubview(iconImage)
           
           iconImage.translatesAutoresizingMaskIntoConstraints = false
           
           //Distance below top
           iconImage.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 30).isActive = true
           iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           iconImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
           iconImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
       }
       
       func setupTempLabel() {
           tempLabel.text = "25°C"
           tempLabel.textAlignment = .center
           tempLabel.font = UIFont.systemFont(ofSize: 100, weight: .bold)
           tempLabel.textColor = UIColor(red: 15/255, green: 149/255, blue: 143/255, alpha: 1)
           view.addSubview(tempLabel)
           
           tempLabel.translatesAutoresizingMaskIntoConstraints = false
           tempLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 16).isActive = true
           tempLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
           tempLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
       }
    
    func setupHumidityImg() {
        humidityImg.image = UIImage(named: "humidity.png")
        humidityImg.contentMode = .scaleAspectFit
        view.addSubview(humidityImg)
        
        humidityImg.translatesAutoresizingMaskIntoConstraints = false
        humidityImg.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 80).isActive = true
        humidityImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -130).isActive = true
        humidityImg.widthAnchor.constraint(equalToConstant: 60).isActive = true
        humidityImg.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    func setupCloudImg() {
        cloudImg.image = UIImage(named: "cloud.png")
        cloudImg.contentMode = .scaleAspectFit
        view.addSubview(cloudImg)
        
        cloudImg.translatesAutoresizingMaskIntoConstraints = false
        cloudImg.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 80).isActive = true
        cloudImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        cloudImg.widthAnchor.constraint(equalToConstant: 60).isActive = true
        cloudImg.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    func setupWindyImg() {
        WindyImg.image = UIImage(named: "windy.png")
        WindyImg.contentMode = .scaleAspectFit
        view.addSubview(WindyImg)
        
        WindyImg.translatesAutoresizingMaskIntoConstraints = false
        WindyImg.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 80).isActive = true
        WindyImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 130).isActive = true
        WindyImg.widthAnchor.constraint(equalToConstant: 60).isActive = true
        WindyImg.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupHumidityLabel() {
        humidityLabel.text = "80 mm"
        humidityLabel.textAlignment = .center
        humidityLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(humidityLabel)
        
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.topAnchor.constraint(equalTo: humidityImg.bottomAnchor, constant: 40).isActive = true
        humidityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -130).isActive = true
        humidityLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        humidityLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    func setupCloudLabel() {
        cloudLabel.text = "50%"
        cloudLabel.textAlignment = .center
        cloudLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(cloudLabel)
        
        cloudLabel.translatesAutoresizingMaskIntoConstraints = false
        cloudLabel.topAnchor.constraint(equalTo: humidityImg.bottomAnchor, constant: 40).isActive = true
        cloudLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        cloudLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        cloudLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    func setupWindyLabel() {
        WindyLabel.text = "5 m/s"
        WindyLabel.textAlignment = .center
        WindyLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(WindyLabel)
        
        WindyLabel.translatesAutoresizingMaskIntoConstraints = false
        WindyLabel.topAnchor.constraint(equalTo: humidityImg.bottomAnchor, constant: 40).isActive = true
        WindyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 130).isActive = true
        WindyLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        WindyLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
