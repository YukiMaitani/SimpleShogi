//
//  BoardView.swift
//  SimpleShogi
//
//  Created by 米谷裕輝 on 2022/04/19.
//

import UIKit

class BoardView: UIView {
    
    let numberOfSquare = 5
    var pieces = Set<Piece>()

    override func draw(_ rect: CGRect) {
        drawBoard(rect: rect)
        drawPiece(rect: rect)
    }
    
    func drawBoard(rect:CGRect){
        let path = UIBezierPath()
        UIColor.black.setStroke()
        for i in 1...4 {
            //縦線
            path.move(to: CGPoint(x: i * Int(rect.maxX)/numberOfSquare, y: Int(rect.minY)))
            path.addLine(to: CGPoint(x: i * Int(rect.maxX)/numberOfSquare, y: Int(rect.maxY)))
            path.close()
            
            //横線
            path.move(to: CGPoint(x: Int(rect.minX), y: i * Int(rect.maxY)/numberOfSquare))
            path.addLine(to: CGPoint(x: Int(rect.maxX), y: i * Int(rect.maxY)/numberOfSquare))
            path.close()
            
            //描写
            path.stroke()
        }
    }
    
    func drawPiece(rect:CGRect){
        //マスの長さ
        let length = Int(rect.maxX)/numberOfSquare
        let pieceMargin = 10
        
        for piece in pieces {
            let pieceImage = UIImage(named: piece.imageName)
            pieceImage?.draw(in: CGRect(x: piece.col * length + pieceMargin/2, y: piece.row * length + pieceMargin/2, width: length - pieceMargin, height: length - pieceMargin))
        }
    }

}
