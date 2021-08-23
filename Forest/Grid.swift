//
//  Grid.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import Foundation

typealias Coordinate = (x: Int, y: Int)

struct Grid {
    let size: Int
    var plottables: [Plottable]
    
    init(size: Int) {
        self.size = size
        plottables = Array(repeating: Ground(), count: size * size)
    }
    
    subscript(coordinate: Coordinate) -> Plottable? {
        get {
            if isInBounds(coordinate) {
                let index = coordinate.x * size + coordinate.y
                return plottables[index]
            }
            return nil
        }
        
        set {
            if isInBounds(coordinate) {
                let index = coordinate.x * size + coordinate.y
                plottables[index] = newValue ?? Ground()
            }
        }
    }
    
    func isInBounds(_ coordinate: Coordinate) -> Bool {
        let xBounds = coordinate.x >= 0 && coordinate.x < size
        let yBounds = coordinate.y >= 0 && coordinate.y < size
        return xBounds && yBounds
    }
    
    func randomCoordinate() -> Coordinate {
        let randX = Int.random(in: 0 ..< size)
        let randY = Int.random(in: 0 ..< size)
        return Coordinate(x: randX, y: randY)
    }
    
    func randomCoordinate(near coordinate: Coordinate) -> Coordinate {
        let randDX = Int.random(in: -1 ..< 2)
        let randDY = Int.random(in: -1 ..< 2)
        
        let newX = coordinate.x + randDX
        let newY = coordinate.y + randDY
        
        let newCoordinate = Coordinate(x: newX, y: newY)
        
        guard newCoordinate != coordinate else {
            return randomCoordinate(near: coordinate)
        }
        
        guard self[newCoordinate] != nil else {
            return randomCoordinate(near: coordinate)
        }
        
        return newCoordinate
    }
    
    func randomGroundCoordinate(near coordinate: Coordinate) -> Coordinate? {
        var maxRetries = 3
        
        while maxRetries > 0 {
            let rand = randomCoordinate(near: coordinate)
            
            if self[rand] is Ground {
                return rand
            }
            maxRetries -= 1
        }
        return nil
    }
    
}
