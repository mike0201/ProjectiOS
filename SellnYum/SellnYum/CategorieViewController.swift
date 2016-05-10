//
//  CategorieViewController.swift
//  SellnYum
//
//  Created by student5310 on 12/02/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit

class CategorieViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    
    @IBOutlet weak var categoryListView: UITableView!
    
    let segueCategory = "segueCategorieToSousCategorie"
    
    var tab = ModelGenerator.allCategories()
    override func viewDidLoad() {
        super.viewDidLoad()

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

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "myCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as! CategoryTableViewCell
        let row = indexPath.row
        
        cell.creatCell(tab[row])
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            switch(segueIdentifier){
            case segueCategory:
                
                let index = categoryListView.indexPathForSelectedRow
                let detailViewController = segue.destinationViewController as! TopRepasViewController
                
                if let indexPath = index {
                    let category = tab[indexPath.row].meals
                    let title = tab[indexPath.row].name
                    detailViewController.titre = title
                    detailViewController.tab = category
                    detailViewController.fromCategorie = true
                    categoryListView.deselectRowAtIndexPath(indexPath, animated: true)
                }
                
                
                break
                
            default:
                
                break
            }
        }

    }
    
}
