//
//  Forest.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import Foundation

class Forest {
    private(set) var grid: Grid
    var woodCollected = 0
    var bearAttacks = 0
    var woodcutterPopulation = 0
    var month = 0
    var year = 0
    
    init(grid: Grid) {
        self.grid = grid
        setupForest()
    }
    
    func setupForest() {
        woodcutterPopulation = grid.size / 2
        let bearPopulation = grid.size / 2
        let treePopulation = grid.size * grid.size / 2
        
        randomlyPlace(Woodcutter(), count: woodcutterPopulation)
        randomlyPlace(Bear(), count: bearPopulation)
        randomlyPlace(Tree(), count: treePopulation)
    }
    
    func randomlyPlace(_ plottable: Plottable, count: Int) {
        var remaining = count
        
        while remaining > 0 {
            let coordinate = grid.randomCoordinate()
            if grid[coordinate] is Ground {
                grid[coordinate] = plottable
                remaining -= 1
            }
        }
    }
    
    func spawnSeedling(near coordinate: Coordinate) {
        if let validNeighbour = grid.randomGroundCoordinate(near: coordinate) {
            grid[validNeighbour] = Tree(state: .seedling, age: 0)
        }
    }
    
    func update() {
        for y in 0 ..< grid.size {
            for x in 0 ..< grid.size {
                let coordinate = Coordinate(x: x, y: y)
                if grid[coordinate] is Ground {
                    continue
                }
                
                if let tree = grid[coordinate] as? Tree {
                    update(tree: tree, at: coordinate)
                }
                if let moveable = grid[coordinate] as? Moveable {
                    update(moveable: moveable, at: coordinate)
                }
            }
        }
        month += 1
        if month == 12 {
            year += 1
            month = 0
            
            if woodCollected > woodcutterPopulation {
                let surplus = woodCollected - woodcutterPopulation
                let numberToHire = surplus / 10
                woodcutterPopulation += numberToHire
                randomlyPlace(Woodcutter(), count: numberToHire)
            }
            
            print("-------------------")
            print("Year", year)
            print("-------------------")
            print("Bear Attacks", bearAttacks)
            print("Wood Collected", woodCollected)
            print("Working woodcutters", woodcutterPopulation)
            print("")
            woodCollected = 0
            bearAttacks = 0
        }
    }
    
    func update(tree: Tree, at coordinate: Coordinate) {
        let updatedAge = tree.age + 1
        var updatedState = tree.state
        
        if updatedAge == 18 {
            updatedState = .mature
        } else if updatedAge == 180 {
            updatedState = .elder
        }
        
        let updatedTree = Tree(state: updatedState, age: updatedAge)
        if tree.shouldSpawnSeedling {
            spawnSeedling(near: coordinate)
        }
        grid[coordinate] = updatedTree
    }
    
    func update(moveable: Moveable, at coordinate: Coordinate) {
        var moveDistance = moveable.moveDistance
        var finalLocation = coordinate
        
        while moveDistance > 0 {
            let randNeighbour = grid.randomCoordinate(near: finalLocation)
            moveDistance -= 1
            
            if grid[randNeighbour] is Ground {
                finalLocation = randNeighbour
                continue
            }
            
            if moveable is Woodcutter {
                guard let tree = grid[randNeighbour] as? Tree else { continue }
                guard tree.state != .seedling else { continue }
                
                finalLocation = randNeighbour
                woodCollected += tree.wood
                break
            }
            
            if moveable is Bear {
                guard grid[randNeighbour] is Woodcutter else { continue }
                woodcutterPopulation -= 1
                bearAttacks += 1
                finalLocation = randNeighbour
                break
            }
        }
        
        if finalLocation != coordinate {
            grid[finalLocation] = grid[coordinate]
            grid[coordinate] = Ground()
        }
    }
}
