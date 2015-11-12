//
//  ViewController.swift
//  Forecast
//
//  Created by Richard Neitzke on 11/9/15.
//  Copyright © 2015 Richard Neitzke. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let apiManager = APIManager()
    
    @IBOutlet weak var day0: WeatherConditionView!
    @IBOutlet weak var day1: WeatherConditionView!
    @IBOutlet weak var day2: WeatherConditionView!
    @IBOutlet weak var day3: WeatherConditionView!
    @IBOutlet weak var day4: WeatherConditionView!
    @IBOutlet weak var day5: WeatherConditionView!
    
    @IBAction func refreshPressed(sender: UIBarButtonItem) {
        apiManager.fetchForecast(self)
        
    }
    
    override func viewDidLoad() {
        apiManager.fetchForecast(self)
        
        //Inserts Background Gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        let color1 = UIColor(red: 1, green: 1, blue: 1, alpha: 0).CGColor as CGColorRef
        let color2 = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2]
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        //Makes Navigation Bar Transparent
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }

    
    //Fills the UI with Data from a [WeatherCondition]
    func showData(weatherConditions:[WeatherCondition]) {
        print("Reloading UI...")
        
        let days = [day0, day1, day2, day3, day4, day5]
        
        for i in 0...5 {
            let day = days[i]
            let wtr = weatherConditions[i]
            
            if day.dayLabel != nil {day.dayLabel.text = wtr.day}
            day.iconLabel.text = wtr.iconChar
            day.degreeLabel.text = "\(wtr.degrees)\(wtr.unit)"
        }
        
        self.view.backgroundColor = weatherConditions[0].color
        
        print("Successfully filled UI with delegated Data!")
        
    }

}