//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    @IBAction func restartGame(_ sender: Any) {
//        board = GameBoard()
//        gameState = .active(.x)
        currentGame.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
//        guard case let GameState.active(player) = gameState else {
//            NSLog("Game is over")
//            return
//        }
        
        do {
            try currentGame.makeMark(at: coordinate)
//            try board.place(mark: player, on: coordinate)
//            if game(board: board, isWonBy: player) {
//                gameState = .won(player)
//            } else if board.isFull {
//                gameState = .cat
//            } else {
//                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
//                gameState = .active(newPlayer)
//            }
        } catch {
            NSLog("Illegal move: \(error)")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded,
            let activePlayer = currentGame.activePlayer else { return }
        
        if !currentGame.gameIsOver {
            statusLabel.text = "Player \(activePlayer.stringValue)'s turn"
        } else if currentGame.board.isFull && currentGame.winningPlayer == nil {
            statusLabel.text = "Cat's game!"
        } else if let winningPlayer = currentGame.winningPlayer {
            statusLabel.text = "Player \(winningPlayer.stringValue) won!"
        }
        
//        switch gameState {
//        case let .active(player):
//            statusLabel.text = "Player \(player.stringValue)'s turn"
//        case .cat:
//            statusLabel.text = "Cat's game!"
//        case let .won(player):
//            statusLabel.text = "Player \(player.stringValue) won!"
//        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
            boardViewController.board = currentGame.board
            
        }
    }
    
    private var currentGame = Game() {
        didSet {
            updateViews()
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = currentGame.board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
//    private var gameState = GameState.active(.x) {
//        didSet {
//            updateViews()
//        }
//    }
    
//    private var board = GameBoard() {
//        didSet {
//            boardViewController.board = board
//        }
//    }
}
