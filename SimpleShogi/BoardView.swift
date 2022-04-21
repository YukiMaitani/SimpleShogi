//
//  BoardView.swift
//  SimpleShogi
//
//  Created by 米谷裕輝 on 2022/04/19.
//

import UIKit

class BoardView: UIView {
    
    let numberOfSquare = 5  //盤の１辺のマス数
    var pieces = Set<Piece>()
    var squareLength:Int!
    var delegate:BoardViewDelegate?
    var fromCol:Int = -1
    var fromRow:Int = -1

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
        squareLength = Int(rect.maxX)/numberOfSquare
        let pieceMargin = 10
        
        //駒の画像を配置
        for piece in pieces {
            let pieceImage = UIImage(named: piece.imageName)
            pieceImage?.draw(in: CGRect(x: piece.col * squareLength + pieceMargin/2, y: piece.row * squareLength + pieceMargin/2, width: squareLength - pieceMargin, height: squareLength - pieceMargin))
        }
    }
    
    //タッチした時の盤内の座標
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        fromCol = Int(first.location(in: self).x)/squareLength
        fromRow = Int(first.location(in: self).y)/squareLength
    }
    
    //タッチが離れた時の盤内の座標
    //デリゲートを使ってコントローラーに通知
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let toCol = Int(first.location(in: self).x)/squareLength
        let toRow = Int(first.location(in: self).y)/squareLength
        delegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }

}
