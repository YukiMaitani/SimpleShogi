//
//  ShogiEngine.swift
//  SimpleShogi
//
//  Created by 米谷裕輝 on 2022/04/19.
//

import Foundation

struct ShogiEngine{
    var pieces = Set<Piece>()
    
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
