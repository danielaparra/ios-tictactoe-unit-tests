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
        var game = Game()
        
        XCTAssertNoThrow(try game.makeMark(at: (0,0)))
    }
    
    func testMakeMarkOnEmptySquare() {
        var game = Game()
        /*
         x - -
         o - - <- adding o at (0,1)
         - - -
         */
        try! game.makeMark(at: (0,0))

        XCTAssertNoThrow(try game.makeMark(at: (0,1)))
    }
    
    func testMakeMarkOnFilledSquare() {
        var game = Game()

        try! game.makeMark(at: (0,0))
        XCTAssertThrowsError(try game.makeMark(at: (0,0)))
    }
    
    func testMakeWinningMarkForX() {
        var game = Game()
        /*
         x o -
         x o - <- adding o at (0,1)
         x - -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        
        XCTAssertEqual(game.winningPlayer, .x)
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
    }
    
    func testMakeCatsGameMark() {
        var game = Game()
        /*
         x o o
         o x x
         x x o
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (2,1))
        XCTAssertTrue(game.board.isFull)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testActiveGame() {
        var game = Game()
        /*
         x x -
         o o -
         x - -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (1,0))
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertEqual(game.activePlayer, .o)
    }
}
