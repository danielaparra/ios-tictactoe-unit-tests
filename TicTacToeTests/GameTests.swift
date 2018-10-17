//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Daniela Parra on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestartGame() {
        
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: true, winningPlayer: .o)
        
        game.restart()
        XCTAssertFalse(board.isFull)
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testMakeMarkOnNewBoard() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        
        XCTAssertNoThrow(try game.makeMark(at: (0,0)))
    }
    
    func testMakeMarkOnFullBoard(){
        let board = GameBoard()
        
    }

}
