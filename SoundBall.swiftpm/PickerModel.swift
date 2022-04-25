//
//  Model.swift
//  SoundBall
//
//  Created by KangMinGyu on 2022/04/11.
//

import Foundation

// MARK: Object Select Enum
enum ObjectCase: String, CaseIterable, Identifiable {
    case width, height
    var id: Self { self }
    var suggestedObject: Object {
        switch self {
        case .width: return .rectWidth
        case .height: return .rectHeight
        }
    }
}
enum Object: String, CaseIterable, Identifiable {
    case rectWidth, rectHeight
    var id: Self { self }
}
// MARK: Pitch Select Enum
enum pitches: String, CaseIterable, Identifiable {
    case C3,D3,E3,F3,G3,A3,B3,C4,D4,E4,F4
    var id: Self { self }
    var suggestedPitches: PitchCase {
        switch self {
        case .C3: return .C3
        case .D3: return .D3
        case .E3: return .E3
        case .F3: return .F3
        case .G3: return .G3
        case .A3: return .A3
        case .B3: return .B3
        case .C4: return .C4
        case .D4: return .D4
        case .E4: return .E4
        case .F4: return .F4
        }
    }
}
enum PitchCase: String, CaseIterable, Identifiable {
    case C3,D3,E3,F3,G3,A3,B3,C4,D4,E4,F4
    var id: Self { self }
}
