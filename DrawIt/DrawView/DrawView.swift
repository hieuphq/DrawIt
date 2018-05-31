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
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var drawColor = UIColor.black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(frame: CGRect.zero)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            lastPoint = pos
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let newPoint = touch.location(in: self)
            lines.append(Line(start:lastPoint, end: newPoint, color: drawColor))
            lastPoint = newPoint
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            context.setLineWidth(2.0)
            
            for l in lines {
                context.setStrokeColor(l.color.cgColor)
                context.move(to: CGPoint(x: l.startX, y: l.startY))
                context.addLine(to: CGPoint(x: l.endX, y: l.endY))
                context.strokePath()
            }
            
        }
    }
}
