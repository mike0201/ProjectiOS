//
//  DrawView.swift
//  DrawFigureColored
//
//  Created by student5310 on 11/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit

enum TypeForm {
    case LIGNE
    case RECTANGLE
    case CERCLE
}


class DrawView: UIView {

    var panGestureRecognizer = UIPanGestureRecognizer()
    var color = UIColor.redColor()
    var type = TypeForm.LIGNE
    var finishDraw = false
    var startPoint=CGPoint()
    var endPoint = CGPoint()
    var widthLine:Float = 5.0
    var cancelledDraw = [Forme]()
    var drawedForme = [Forme]()
    var mutablePath:CGMutablePath?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DrawView.refreshUI(_:)))
        addGestureRecognizer(panGestureRecognizer)
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        super.drawRect(rect)
        
        for forme in drawedForme {
            forme.color.setStroke()
            forme.bezierPath.stroke()
        }
        
        if let path = mutablePath {
            var bezierPath = UIBezierPath()
            color.setStroke()
            
            
            switch type {
            case .LIGNE:
                CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y)
                CGPathAddLineToPoint(path, nil, endPoint.x, endPoint.y)
                print("start point(\(startPoint.x),\(startPoint.y)) et endpoint (\(endPoint.x),\(endPoint.y))")
                break
            case .CERCLE:
                CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y)
                CGPathAddEllipseInRect(path, nil, CGRectMake(startPoint.x, startPoint.y,endPoint.x - startPoint.x, endPoint.y - startPoint.y))
                
                print("start point(\(startPoint.x),\(startPoint.y)) et endpoint (\(endPoint.x),\(endPoint.y))")
                
                break
            case .RECTANGLE:
                CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y)
                CGPathAddRect(path, nil, CGRectMake(startPoint.x, startPoint.y,endPoint.x - startPoint.x, endPoint.y - startPoint.y))
                
                print("start point(\(startPoint.x),\(startPoint.y)) et endpoint (\(endPoint.x),\(endPoint.y))")
                
                break
            default:
                break
            }
            
            bezierPath = UIBezierPath(CGPath: path)
            bezierPath.lineWidth = CGFloat(widthLine)
            
            bezierPath.stroke()
            
            
            /*
            if finishDraw {
                
                
                let form = Forme(path: bezierPath,color: color)
                
                drawedForme.append(form)
                finishDraw=false
                
            }
 */

        }
        
        
    }
    
    func refreshUI(gestureRecognizer:UIGestureRecognizer){
        
        let touch = gestureRecognizer.locationInView(self)
        let stateTouch = gestureRecognizer.state
        
        switch stateTouch {
        case .Began:
            startPoint=touch
            mutablePath = CGPathCreateMutable()
           // endPoint=touch
            break
        case .Changed:
            endPoint = touch
            mutablePath = CGPathCreateMutable()
            self.setNeedsDisplay()
            break
        case .Ended:
            endPoint = touch
            finishDraw=true
            
            if let path = mutablePath {
                
                let bezierPath = UIBezierPath(CGPath: path)
                bezierPath.lineWidth = CGFloat(widthLine)
                
                
                let form = Forme(path: bezierPath,color: color)
                
                drawedForme.append(form)
            }
         
            mutablePath = nil

            

            
            self.setNeedsDisplay()
            break
        default:
            break
        }
        
        
        
    }
    func cancelDraw(){
        if let draw = drawedForme.last{
        cancelledDraw.append(draw)
            drawedForme.removeLast()
        }
        self.setNeedsDisplay()
    }
    func drawAgain(){
        if let draw = cancelledDraw.last {
            
            drawedForme.append(draw)
            cancelledDraw.removeLast()
        }
        self.setNeedsDisplay()
    }
    

}
