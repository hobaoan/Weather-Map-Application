//
//  ViewController.swift
//  Weather Map
//
//  Created by Hồ Bảo An on 09/02/2023.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let btnSearch = UIButton()
    let tfSearch = UITextField()
    
    var lat: Double = 0
    var lon: Double = 0
    var inputNameCity: String = "111"
    
    public var name: String = ""
    public var temp: Double = 1
    public var humidity: Int = 1
    public var cloud: Int = 1
    public var wind: Double = 1
    public var icon: String = ""

    private let map: MKMapView = {
        let map = MKMapView()
        return map
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        getAPI(inputNameCity: "Saigon")
        view.addSubview(map)
        
        // Create UITextField
        tfSearch.frame = CGRect(x: 20, y: 60, width: view.frame.width - 100, height: 50)
        tfSearch.layer.cornerRadius = 25
        tfSearch.layer.borderColor = UIColor.gray.cgColor
        tfSearch.layer.borderWidth = 1
        tfSearch.backgroundColor = UIColor.white
        tfSearch.placeholder = "Enter location here"
        tfSearch.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfSearch.frame.height))
        tfSearch.leftViewMode = .always
        view.addSubview(tfSearch)
        
        //Create UIButton
        btnSearch.setImage(UIImage(named: "search.png"), for: .normal)
        btnSearch.layer.borderColor = UIColor.gray.cgColor
        btnSearch.layer.borderWidth = 1
        btnSearch.frame = CGRect(x: view.frame.width - 70 , y: 60, width: 50, height: 50)
        btnSearch.layer.cornerRadius = btnSearch.frame.width / 2
        btnSearch.layer.masksToBounds = true
        btnSearch.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(btnSearch)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
        
        map.delegate = self
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let span = MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = name
        map.addAnnotation(annotation)
    }

    private func getAPI (inputNameCity: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(inputNameCity)&units=metric&appid=ac212f5768bf3e2f84201adbd2bc7961"
        
        guard let url = URL(string: urlString) else {
            print("Error: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching weather data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                let weatherData = try JSONDecoder().decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    
                    // Gán giá trị cho biến
                    self.name = weatherData.name
                    self.lon = weatherData.coord.lon
                    self.lat = weatherData.coord.lat
                    self.temp = weatherData.main.temp
                    self.humidity = weatherData.main.humidity
                    self.cloud = weatherData.clouds.all
                    self.wind = weatherData.wind.speed
                    self.icon = weatherData.weather[0].icon
                    
                    self.viewDidLayoutSubviews()
                }
            } catch let decodeError {
                print("Error decoding weather data: \(decodeError.localizedDescription)")
            }
        }.resume()
    }
    
    @objc func buttonAction() {
        let getNamecity: String = tfSearch.text!
        getAPI(inputNameCity: getNamecity)
        print(inputNameCity)
    }
       
    func mapView(_ map: MKMapView, didSelect view: MKAnnotationView) {
        let weatherViewController = WeatherViewCotroller()
        self.present(weatherViewController, animated: true)
        return
    }
    
    


}


