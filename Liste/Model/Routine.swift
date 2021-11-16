//
//  Routine.swift
//  Liste
//
//  Created by Nadia Bordoni on 12/11/21.
//

import UIKit

struct Routine {
    var selectedWork: Bool = false
    var selectedStudy: Bool = false
    var selectedSports: Bool = false
    var selectedFun: Bool = false
    
    mutating func nextRoutine() -> Activies{
        if selectedWork { selectedWork = false; return .work }
        else if selectedStudy { selectedStudy = false; return .study }
        else if selectedSports { selectedSports = false; return .sports }
        else if selectedFun { selectedFun = false; return .fun }
        
        return .none
    }
}

enum Activies {
    case work
    case study
    case sports
    case fun
    case none
}
