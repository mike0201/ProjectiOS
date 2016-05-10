//
//  DetailViewController.swift
//  SellnYum
//
//  Created by student5310 on 12/02/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var prixLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var meal : Meal!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prixLabel.text = String(meal.price) + " €"
        descriptionLabel.text = meal.description
        
        self.navigationItem.title = meal.name
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func commandMeal(sender: AnyObject) {
        
        // create the alert
        let alert = UIAlertController(title: "Commande Validée", message: "Votre commande a été éffectuée avec succès. Bon appétit!", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
