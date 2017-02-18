//
//  FormViewController.swift
//  DITAssessment
//
//  Created by Victor Hong on 17/02/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var favouriteColourLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var carsLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    var favouriteColour: String?
    var salary: String?
    var activity: String?
    var cars: String?
    var comments: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let user = UserDefaults.standard.dictionary(forKey: "currentUser")
        let firstName = user?["firstName"] as? String
        let lastName = user?["lastName"] as? String
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
        
        favouriteColourLabel.text = favouriteColour ?? "No colour was selected"
        salaryLabel.text = salary ?? "No salary was selected"
        activityLabel.text = activity
        if cars == "" {
            carsLabel.text = "0"
        } else {
            carsLabel.text = cars
        }
        if comments == "" {
            commentsLabel.text = "No comments were made"
        } else {
            commentsLabel.text = comments
        }
        
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
