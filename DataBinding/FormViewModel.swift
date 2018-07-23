//
//  FormViewModel.swift
//  DataBinding
//
//  Created by Manu Rodríguez on 23/07/2018.
//  Copyright © 2018 Manu Rodríguez. All rights reserved.
//

import Foundation

struct FormViewModel{
    let name :Observable<String> = Observable()
    let approxSalary :Observable<Float> = Observable()
    let yearOfExperience :Observable<Double> = Observable()
    
    func getName() -> String{
        if let name = name.value{
            return name
        }
        return ""
    }
    
    func getSalary() -> String{
        if let approxSalary = approxSalary.value{
            let normalizedValue = approxSalary / 1000.0
            return "\(normalizedValue)"
        }
        return ""
    }
    
    func getExperienceString() -> String{
        if let years = yearOfExperience.value{
            return "\(years) years"
        }
        return ""
    }
}
