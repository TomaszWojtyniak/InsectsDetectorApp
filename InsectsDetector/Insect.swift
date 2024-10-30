//
//  Insect.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 30/10/2024.
//

import Foundation

enum Insect: String, Equatable {
    case ant
    case bee
    case wasp
    case butterfly
    case ladybug
    case moth
    case bumblebee
    case fly
    case cockroach
    case graphosoma
    case mantis
    case mosquito
    case spider
    case scorpionfly
    
    var name: String {
        switch self {
        case .ant:
            String(localized: "Ant")
        case .bee:
            String(localized: "Bee")
        case .wasp:
            String(localized: "Wasp")
        case .butterfly:
            String(localized: "Butterfly")
        case .ladybug:
            String(localized: "Ladybug")
        case .moth:
            String(localized: "Moth")
        case .bumblebee:
            String(localized: "Bumblebee")
        case .fly:
            String(localized: "Fly")
        case .cockroach:
            String(localized: "Cockroach")
        case .graphosoma:
            String(localized: "Graphosoma")
        case .mantis:
            String(localized: "Mantis")
        case .mosquito:
            String(localized: "Mosquito")
        case .spider:
            String(localized: "Spider")
        case .scorpionfly:
            String(localized: "Scorpionfly")
        }
    }
    
    var imageName: String {
        switch self {
        case .ant:
            ""
        case .bee:
            ""
        case .wasp:
            ""
        case .butterfly:
            ""
        case .ladybug:
            ""
        case .moth:
            ""
        case .bumblebee:
            ""
        case .fly:
            ""
        case .cockroach:
            ""
        case .graphosoma:
            ""
        case .mantis:
            ""
        case .mosquito:
            ""
        case .spider:
            ""
        case .scorpionfly:
            ""
        }
    }
    
    var description: String {
        switch self {
        case .ant:
            ""
        case .bee:
            ""
        case .wasp:
            ""
        case .butterfly:
            ""
        case .ladybug:
            ""
        case .moth:
            ""
        case .bumblebee:
            ""
        case .fly:
            ""
        case .cockroach:
            ""
        case .graphosoma:
            ""
        case .mantis:
            ""
        case .mosquito:
            ""
        case .spider:
            ""
        case .scorpionfly:
            ""
        }
    }
}
