//
//  Preferences ViewController.swift
//  DITAssessment
//
//  Created by Victor Hong on 17/02/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class Preferences_ViewController: UIViewController {

    @IBOutlet weak var favouriteColourSegementedControl: UISegmentedControl!
    @IBOutlet weak var salarySegementedControl: UISegmentedControl!
    
    @IBOutlet weak var movieCheckbox: M13Checkbox!
    @IBOutlet weak var swimmingCheckbox: M13Checkbox!
    @IBOutlet weak var colouringCheckbox: M13Checkbox!
    @IBOutlet weak var runningCheckbox: M13Checkbox!
    @IBOutlet weak var bikingCheckbox: M13Checkbox!
    @IBOutlet weak var mountainClimbingCheckbox: M13Checkbox!
    @IBOutlet weak var familyCheckbox: M13Checkbox!
    @IBOutlet weak var skatingCheckbox: M13Checkbox!
    @IBOutlet weak var skiingCheckbox: M13Checkbox!
    @IBOutlet weak var noneCheckbox: M13Checkbox!
    
    @IBOutlet weak var carsTextField: UITextField!
    @IBOutlet weak var commentsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setCheckBox(checkbox: movieCheckbox)
        setCheckBox(checkbox: swimmingCheckbox)
        setCheckBox(checkbox: colouringCheckbox)
        setCheckBox(checkbox: runningCheckbox)
        setCheckBox(checkbox: bikingCheckbox)
        setCheckBox(checkbox: mountainClimbingCheckbox)
        setCheckBox(checkbox: familyCheckbox)
        setCheckBox(checkbox: skatingCheckbox)
        setCheckBox(checkbox: skiingCheckbox)
        setCheckBox(checkbox: noneCheckbox)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if(!isUserLoggedIn) {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }

    @IBAction func favouriteColourChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("red")
            sender.tintColor = .red
        case 1:
            print("blue")
            sender.tintColor = .blue
        case 2:
            print("yellow")
            sender.tintColor = .yellow
        case 3:
            print("Other")
            sender.tintColor = .black
        default:
            break
        }
    }
    
    @IBAction func salaryChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("<30k")
        case 1:
            print("30-35k")
        case 2:
            print("35-40k")
        case 3:
            print("40-45K")
        case 4:
            print("45K+")
        default:
            break
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        print(favouriteColourSegementedControl.selectedSegmentIndex)
        print(salarySegementedControl.selectedSegmentIndex)
        
        print(movieCheckbox.checkState)
        print(swimmingCheckbox.checkState)
        print(colouringCheckbox.checkState)
        print(runningCheckbox.checkState)
        print(bikingCheckbox.checkState)
        print(mountainClimbingCheckbox.checkState)
        print(familyCheckbox.checkState)
        print(skatingCheckbox.checkState)
        print(skiingCheckbox.checkState)
        print(noneCheckbox.checkState)
        
//        let user = UserDefaults.standard.dictionary(forKey: "currentUser")
//        print(user?["lastName"] ?? "")
//        print(user?["firstName"] ?? "")
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        
        UserDefaults.standard.set(false,forKey:"isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }
    func setCheckBox(checkbox: M13Checkbox) {
        
        // Or toggle the state
        checkbox.toggleCheckState(false)
        
        // Set values to the checkbox to return depending on its state.
        checkbox.checkedValue = 1.0
        checkbox.uncheckedValue = 0.0
        checkbox.mixedValue = 0.5
        
        //: Animations
        //: ----------
        
        // Update the animation duration
        checkbox.animationDuration = 1.0
        
        // Change the animation used when switching between states.
        checkbox.stateChangeAnimation = .bounce(.fill)
        
        //: Appearance
        //: ----------
        
        // The background color of the veiw.
        checkbox.backgroundColor = .white
        // The tint color when in the selected state.
        checkbox.tintColor = .blue
        // The tint color when in the unselected state.
        checkbox.secondaryTintColor = .blue
        // The color of the checkmark when the animation is a "fill" style animation.
        checkbox.secondaryCheckmarkTintColor = .white
        
        // Whether or not to display a checkmark, or radio mark.
        checkbox.markType = .checkmark
        // The line width of the checkmark.
        checkbox.checkmarkLineWidth = 2.0
        
        // The line width of the box.
        checkbox.boxLineWidth = 2.0
        // The corner radius of the box if it is a square.
        checkbox.cornerRadius = 1.0
        // Whether the box is a square, or circle.
        checkbox.boxType = .square
        // Whether or not to hide the box.
        checkbox.hideBox = false
        checkbox.setCheckState(.unchecked, animated: false)
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
