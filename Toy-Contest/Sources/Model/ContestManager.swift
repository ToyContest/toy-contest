//
//  ContestManager.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation

class ContestManager {
    //var selectedToy : Toy
    static let shared = ContestManager()
    
//    var fstToy = Toy()
//    var secToy = Toy()
    var selectedToys = Array<Toy>()
    var winners = Array<Toy>()
    var maxRounds = 8
    var curRounds = 1
    var knckStage = "16강"
    var tapCnt = 0
    var imgIdx = 0
    
    func resetToys() {
        selectedToys.removeAll()
    }
    
    
    func setCandidate(fstToy : Toy, secToy : Toy) {
        
    }
    
    
    func pushToy(selectedToy : Toy) {
        selectedToys.append(selectedToy)
    }
    
    func pushWinners(toy : Toy) {
        winners.append(toy)
    }
    
    func addTapCnt() {
        tapCnt += 1
        curRounds += 1
        imgIdx += 2
        
        if tapCnt == 8 {
            knckStage = "8강"
            maxRounds = 4
            curRounds = 1
            imgIdx = 0
            //selectedToys.removeAll()
        }
        else if tapCnt == 12 {
            knckStage = "4강"
            maxRounds = 2
            curRounds = 1
            imgIdx = 0
            //selectedToys.removeAll()
        }
        else if tapCnt == 14 {
            knckStage = "결승"
            maxRounds = 1
            curRounds = 1
            imgIdx = 0
            //selectedToys.removeAll()
        }
            
        else if tapCnt == 15 {
            // 결과 화면으로 전환
            allReset()
        }
    }
    
    func allReset() {
        selectedToys.removeAll()
        maxRounds = 8
        curRounds = 1
        knckStage = "16강"
        tapCnt = 0
        imgIdx = 0
    }
    
    func getSelectedToys() -> [Toy] {
        return selectedToys
    }
    
    func getKnckStage() -> String {
        return knckStage
    }
    
    func getMaxRounds() -> Int {
        return maxRounds
    }
    
    func getCurRounds() -> Int {
        return curRounds
    }
    
    func getImgIdx() -> Int {
        return imgIdx
    }
    
    
//    func roundsPrint() {
//        print(knckStage," ",curRounds,"/",maxRounds)
//    }
    
    init() {}
}
