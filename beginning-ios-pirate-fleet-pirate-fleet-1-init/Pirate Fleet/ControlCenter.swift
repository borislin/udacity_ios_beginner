//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 7), isVertical: false)
        let smallShip = Ship(length: 2, location: GridLocation(x: 5, y: 0), isVertical: true)
        let largeShip = Ship(length: 4, location: GridLocation(x: 3, y: 3), isVertical: true)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 0, y: 2), isVertical: false)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        let mine1 = Mine(location: GridLocation(x: 4, y: 5), explosionText: "Exploded!")
        let mine2 = Mine(location: GridLocation(x: 6, y: 3), explosionText: "Exploded!")
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus + (5 - gameStats.humanShipsSunk) * gameStats.shipBonus - (gameStats.numberOfMissesByHuman + gameStats.numberOfHitsOnEnemy) * gameStats.guessPenalty
        
        return finalScore
    }
}