//
//  ViewController.swift
//  DataBinding
//
//  Created by Manu Rodríguez on 23/07/2018.
//  Copyright © 2018 Manu Rodríguez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var salaryRangeSlider: UISlider!
    @IBOutlet weak var yearsOfExperienceStepper: UIStepper!
    
    @IBOutlet weak var nameMaped: UILabel!
    @IBOutlet weak var salaryMaped: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var selectedYearsOfExperience: UILabel!
    
    @IBOutlet weak var testButton: UIButton!
    
    var viewModel = FormViewModel()
    var disposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "MVVM with RXSwift"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupBindings(){
        nameField.rx.text.orEmpty.bind(to: viewModel.username).disposed(by: disposeBag)
        viewModel.name.bind(to: nameMaped.rx.text).disposed(by: disposeBag)
        
        salaryRangeSlider.rx.value.bind(to: viewModel.salaryUser).disposed(by: disposeBag)
        viewModel.salary.map{ String($0) }.bind(to: salaryMaped.rx.text).disposed(by: disposeBag)
        viewModel.salary.map{ String($0) }.bind(to: sliderLabel.rx.text).disposed(by: disposeBag)
        
        
        yearsOfExperienceStepper.rx.value.bind(to: viewModel.experienceUser).disposed(by: disposeBag)
        viewModel.experience.map{ String($0) }.bind(to: selectedYearsOfExperience.rx.text).disposed(by: disposeBag)

        viewModel.isValid.map{$0}.bind(to: testButton.rx.isEnabled).disposed(by: disposeBag)
    }

}

