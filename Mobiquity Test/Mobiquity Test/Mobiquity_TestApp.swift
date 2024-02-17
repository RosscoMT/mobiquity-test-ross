//
//  Mobiquity_TestApp.swift
//  Mobiquity Test
//
//  Created by Ross Viviani on 15/02/2024.
//

import SwiftUI
import Shared

@main
struct Mobiquity_TestApp: App {
    var body: some Scene {
        WindowGroup {
            Shared(view: MainView(service: .init(buildType: .development)))
        }
    }
}
