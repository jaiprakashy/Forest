//
//  ForestView.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import UIKit

class ForestView: UIView {
    var forest: Forest!
    
    var cellSize: CGFloat {
        let dimension = forest.grid.size
        return bounds.width / CGFloat(dimension)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        
        for y in 0 ..< forest.grid.size {
            for x in 0 ..< forest.grid.size {
                let coordinate = Coordinate(x: x, y: y)
                guard let drawableObject = forest.grid[coordinate] as? Drawable else {
                    continue
                }
                
                let xOrigin = CGFloat(coordinate.x) * cellSize
                let yOrigin = CGFloat(coordinate.y) * cellSize
                let origin = CGPoint(x: xOrigin, y: yOrigin)
                let size = CGSize(width: cellSize, height: cellSize)
                let smallRect = CGRect(origin: origin, size: size)
                
                context?.setFillColor(drawableObject.color)
                context?.fill(smallRect)
            }
        }
    }

}
