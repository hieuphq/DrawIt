//
//  Rectangle.swift
//  DrawIt
//
//  Created by Hieu Phan on 5/31/18.
//  Copyright © 2018 Hieu Phan. All rights reserved.
//

import UIKit

class Rectangle: Shape{
    private var start: CGPoint = CGPoint.zero
    private var end: CGPoint = CGPoint.zero
    
    init() {
        super.init(lines: [], color: UIColor.clear)
    }
    init(color: UIColor) {
        super.init(lines: [], color: color)
    }
    var Start: CGPoint {
        set {
            start = newValue
            remakeShape()
        }
        get{
            return start
        }
    }
    
    var End: CGPoint {
        set {
            end = newValue
            remakeShape()
        }
        get{
            return end
        }
    }
    
    override func remakeShape() {
        
        var one, two, three, four: CGPoint
        
        var newLines = [Line]()
        if start.y < end.y {
            if start.x < end.x {
                one = start
                two = CGPoint(x: end.x, y: start.y)
                three = end
                four = CGPoint(x: start.x, y: end.y)
            }else{
                one = CGPoint(x: end.x, y: start.y)
                two = start
                three = CGPoint(x: start.x, y: end.y)
                four = end
            }
        } else {
            if start.x < end.x {
                one = end
                two = CGPoint(x: start.x, y: end.y)
                three = start
                four = CGPoint(x: end.x, y: start.y)
            }else{
                one = CGPoint(x: start.x, y: end.y)
                two = end
                three = CGPoint(x: end.x, y: start.y)
                four = start
            }
        }
        
        newLines.append(Line(start: one, end: two, color: self.Color))
        newLines.append(Line(start: two, end: three, color: self.Color))
        newLines.append(Line(start: three, end: four, color: self.Color))
        newLines.append(Line(start: four, end: one, color: self.Color))
        
        self.Lines = newLines
    }
}
