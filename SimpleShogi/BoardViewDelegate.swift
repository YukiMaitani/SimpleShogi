//
//  BoardViewDelegate.swift
//  SimpleShogi
//
//  Created by 米谷裕輝 on 2022/04/21.
//

import Foundation

protocol BoardViewDelegate{
    func movePiece(fromCol:Int, fromRow:Int, toCol:Int, toRow:Int)
}
