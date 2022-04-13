//
//  Model.swift
//  SoundBalls
//
//  Created by KangMinGyu on 2022/04/11.
//

import Foundation

// MARK: Object Select Enum
enum ObjectCase: String, CaseIterable, Identifiable {
    case ball, wall
    var id: Self { self }
    var suggestedObject: Object {
        switch self {
        case .ball: return .ball
        case .wall: return .wall
        }
    }
}
enum Object: String, CaseIterable, Identifiable {
    case ball, wall
    var id: Self { self }
}
// MARK: Pitch Select Enum
enum pitches: String, CaseIterable, Identifiable {
    case C4,D,E,F,G,A,B,C5
    var id: Self { self }
    var suggestedPitches: PitchCase {
        switch self {
        case .C4: return .C4
        case .D: return .D
        case .E: return .E
        case .F: return .F
        case .G: return .G
        case .A: return .A
        case .B: return .B
        case .C5: return .C5
        }
    }
}
enum PitchCase: String, CaseIterable, Identifiable {
    case C4,D,E,F,G,A,B,C5
    var id: Self { self }
}
