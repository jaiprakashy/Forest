//
//  Forest.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import Foundation

class Forest {
    private(set) var grid: Grid
    
    init(grid: Grid) {
        self.grid = grid
        setupForest()
    }
    
    func setupForest() {
        let woodcutterPopulation = grid.size / 2
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
}
