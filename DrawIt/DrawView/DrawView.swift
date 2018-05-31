//
//  DrawView.swift
//  DrawIt
//
//  Created by Hieu Phan on 5/31/18.
//  Copyright © 2018 Hieu Phan. All rights reserved.
//

import Foundation
import UIKit

class DrawView: UIView {
    
    var shapes: [Shape] = []
    var lines: [Line] = []
    var rectange: Rectangle = Rectangle()
    var lastPoint: CGPoint!
    var drawColor = UIColor.black
    var shapeType = ShapeType.rectangle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(frame: CGRect.zero)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            
            switch shapeType {
            case .line:
                lastPoint = pos
                break
            case .rectangle:
                rectange = Rectangle(color: drawColor)
                rectange.Start = pos
                rectange.End = pos
                break
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let newPoint = touch.location(in: self)
            
            switch shapeType {
            case .line:
                lastPoint = newPoint
                lines.append(Line(start:lastPoint, end: newPoint, color: drawColor))
                break
            case .rectangle:
                rectange.End = newPoint
                break
            }
            self.setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let newPoint = touch.location(in: self)
            
            switch shapeType {
            case .line:
                lines.append(Line(start:lastPoint, end: newPoint, color: drawColor))
                lastPoint = newPoint
                shapes.append(Shape(lines: lines, color: self.drawColor))
                lines = []
                break
            case .rectangle:
                rectange.End = newPoint
                shapes.append(rectange)
                rectange = Rectangle(color: drawColor)
                break
            }
            
            
        }
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            context.setLineWidth(2.0)
            
            for s in shapes {
                s.Draw(context)
            }
            
            for l in lines {
                l.Draw(context)
            }
            
            rectange.Draw(context)
        }
    }
    
    func clear() {
        self.lines = []
        self.shapes = []
        self.setNeedsDisplay()
    }
}
