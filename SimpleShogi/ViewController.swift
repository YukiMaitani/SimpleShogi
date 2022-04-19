//
//  ViewController.swift
//  SimpleShogi
//
//  Created by 米谷裕輝 on 2022/04/19.
//

import UIKit

class ViewController: UIViewController {

    var shogiEngine = ShogiEngine()
    
    @IBOutlet weak var boardView: BoardView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        shogiEngine.initializeGame()
        boardView.pieces = shogiEngine.pieces
        boardView.setNeedsDisplay()
    }


}

