//
//  ShogiEngine.swift
//  SimpleShogi
//
//  Created by 米谷裕輝 on 2022/04/19.
//

import Foundation

struct ShogiEngine{
    var pieces = Set<Piece>()
    
    //駒の移動
    mutating func movePiece(fromCol:Int, fromRow:Int, toCol:Int, toRow:Int){
        guard let piece = pieceAt(col: fromCol, row: fromRow) else { return }
        pieces.remove(piece)
        pieces.insert(Piece(col: toCol, row: toRow, imageName: piece.imageName))
    }
    
    //駒の特定
    func pieceAt(col:Int, row:Int) -> Piece? {
        for piece in pieces {
            if piece.col == col && piece.row == row{
                return piece
            }
        }
        return nil
    }
    
    mutating func initializeGame(){
        pieces.removeAll()
        
        //相手駒
        pieces.insert(Piece(col: 0, row: 0, imageName: "相手飛車"))
        pieces.insert(Piece(col: 1, row: 0, imageName: "相手角行"))
        pieces.insert(Piece(col: 2, row: 0, imageName: "相手銀将"))
        pieces.insert(Piece(col: 3, row: 0, imageName: "相手金将"))
        pieces.insert(Piece(col: 4, row: 0, imageName: "相手玉将"))
        pieces.insert(Piece(col: 4, row: 1, imageName: "相手歩兵"))
        
        //自分駒
        pieces.insert(Piece(col: 0, row: 3, imageName: "歩兵"))
        pieces.insert(Piece(col: 0, row: 4, imageName: "玉将"))
        pieces.insert(Piece(col: 1, row: 4, imageName: "金将"))
        pieces.insert(Piece(col: 2, row: 4, imageName: "銀将"))
        pieces.insert(Piece(col: 3, row: 4, imageName: "角行"))
        pieces.insert(Piece(col: 4, row: 4, imageName: "飛車"))
    }
}
