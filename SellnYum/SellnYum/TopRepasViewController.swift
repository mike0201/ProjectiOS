//
//  TopRepasViewController.swift
//  SellnYum
//
//  Created by student5310 on 12/02/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit

class TopRepasViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, LoginDelegate {
    
    let segueDetail = "segueTopRepasToDetail"
    @IBOutlet weak var topRepasListView: UITableView!
    var tab: [Meal]!
    var fromCategorie:Bool!
    var titre:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if((fromCategorie) != nil)
        {
            self.navigationItem.title=titre
        }
        else {
            demarre()
            tab = ModelGenerator.allTopMeals()
        }
        
        
        
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
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "myCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        
        cell.textLabel?.text = tab[row].name
        
        
        return cell
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let segueIdentifier = segue.identifier {
            switch(segueIdentifier){
            case segueDetail:
                
                let index = topRepasListView.indexPathForSelectedRow
                let detailViewController = segue.destinationViewController as! DetailViewController
                
                if let indexPath = index {
                    let meal = tab[indexPath.row]
                    detailViewController.meal=meal
                    topRepasListView.deselectRowAtIndexPath(indexPath, animated: true)
                }
                
                
                break
                
            default:
                
                break
            }
        }
        
        
        
    }
    
    
    func demarre() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewControllerWithIdentifier("Login") as! LoginViewController
        loginVC.delegate = self
        presentViewController(loginVC, animated: true, completion: nil)
    }
    func logIn() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
