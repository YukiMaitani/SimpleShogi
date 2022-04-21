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
        
        boardView.delegate = self
       
        shogiEngine.initializeGame()
        boardView.pieces = shogiEngine.pieces
        boardView.setNeedsDisplay()
    }
}

extension ViewController:BoardViewDelegate{
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        shogiEngine.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.pieces = shogiEngine.pieces
        boardView.setNeedsDisplay()
    }
}
