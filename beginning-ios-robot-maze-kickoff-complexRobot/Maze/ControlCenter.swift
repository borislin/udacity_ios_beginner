//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

class ControlCenter {
        
    func moveComplexRobot(robot: ComplexRobot) {

        robot.move()
        robot.rotateLeft()
        robot.move(3)
        robot.rotateLeft()
        robot.move()

    }
}