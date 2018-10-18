//
//  Game.swift
//  TicTacToe
//
//  Created by Daniela Parra on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating func restart() {
        self.board = GameBoard()
        self.activePlayer = .x
        self.gameIsOver = false
        self.winningPlayer = nil
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        
        guard let activePlayer = activePlayer else {
            NSLog("Game is over.")
            return
        }
        try board.place(mark: activePlayer, on: coordinate)
        if game(board: board, isWonBy: activePlayer) {
            winningPlayer = activePlayer
            gameIsOver = true
            self.activePlayer = nil
        } else if board.isFull {
            gameIsOver = true
            self.activePlayer = nil
        } else {
            let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            self.activePlayer = newPlayer
        }
    }
    
    private(set) var board: GameBoard = GameBoard()
    
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark?
}
