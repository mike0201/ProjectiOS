//
//  ViewController.swift
//  DrawFigureColored
//
//  Created by student5310 on 11/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySlider: NSLayoutConstraint!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var myView: DrawView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func ValueChange(sender: UISlider) {
       
        valueLabel.text = String(format: "%.2f", sender.value)
        myView.widthLine = Float(sender.value)
        

    }
    @IBAction func ChangeColor(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            myView.color = UIColor.redColor()
            break
        case 1:
            myView.color = UIColor.blueColor()
            break
        case 2:
            myView.color = UIColor.greenColor()
            break
        case 3:
            myView.color = UIColor.orangeColor()
            break
        case 4:
            myView.color = UIColor.yellowColor()
            break
        default:
            break
        }
        
    }
    @IBAction func changeForm(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            myView.type = TypeForm.LIGNE
            break
        case 1:
            myView.type = TypeForm.RECTANGLE
            break
        case 2:
            myView.type = TypeForm.CERCLE
        default:
            break
        }
    }
    @IBAction func drawAgain(sender: UIButton) {
        myView.drawAgain()
        
    }
    @IBAction func cancelDraw(sender: UIButton) {
        myView.cancelDraw()
    }
    
}

