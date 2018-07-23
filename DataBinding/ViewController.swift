//
//  ViewController.swift
//  DataBinding
//
//  Created by Manu Rodríguez on 23/07/2018.
//  Copyright © 2018 Manu Rodríguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var salaryRangeSlider: UISlider!
    @IBOutlet weak var yearsOfExperienceStepper: UIStepper!
    
    @IBOutlet weak var nameMaped: UILabel!
    @IBOutlet weak var salaryMaped: UILabel!
    @IBOutlet weak var selectedYearsOfExperience: UILabel!
    
    var viewModel :FormViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "MVVM Example"
        setupBindings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FormViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupBindings(){
        nameField.bind(with: viewModel.name)
        salaryRangeSlider.bind(with: viewModel.approxSalary)
        yearsOfExperienceStepper.bind(with: viewModel.yearOfExperience)
        
        nameMaped.observe(for: viewModel.name) { [unowned self](_) in
            self.nameMaped.text = self.viewModel.getName()
        }
        
        salaryMaped.observe(for: viewModel.approxSalary) { [unowned self](_) in
            self.salaryMaped.text = self.viewModel.getSalary()
        }
        
        selectedYearsOfExperience.observe(for: viewModel.yearOfExperience) { [unowned self](_) in
            self.selectedYearsOfExperience.text = self.viewModel.getExperienceString()
        }
    }

}

