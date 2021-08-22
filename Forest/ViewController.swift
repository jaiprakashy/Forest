//
//  ViewController.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forestView: ForestView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupForestView()
    }
    
    func setupForestView() {
        let grid = Grid(size: 50)
        let forest = Forest(grid: grid)
        forestView.backgroundColor = UIColor.groundColor
        forestView.forest = forest
    }


}

