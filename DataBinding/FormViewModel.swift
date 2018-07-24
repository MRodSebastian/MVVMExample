//
//  FormViewModel.swift
//  DataBinding
//
//  Created by Manu Rodríguez on 23/07/2018.
//  Copyright © 2018 Manu Rodríguez. All rights reserved.
//

import RxSwift

class FormViewModel{
    let username = Variable<String>("")
    let salaryUser = Variable<Float>(0)
    let experienceUser = Variable<Double>(0)
   
    var name :Observable<String>{
        return self.username.asObservable().map{$0.capitalized}
    }
    
    var salary :Observable<Float>{
        return self.salaryUser.asObservable().map{$0*1000.0}
    }
    
    var experience :Observable<Double>{
        return self.experienceUser.asObservable()
    }
    
    var isValid : Observable<Bool>{
        return self.username.asObservable().map{$0.count > 0}
    }
}
