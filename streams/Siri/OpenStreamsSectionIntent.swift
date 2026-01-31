//
//  OpenStreamsSectionIntent.swift
//  streams
//
//  Created by Anudeep Reddy on 31/01/26.
//
import AppIntents
import UIKit

@available(iOS 16.0, *)
struct OpenStreamsSectionIntent: AppIntent {
    init() {
        
    }
    

    static var title: LocalizedStringResource = "Open Streams Section"
    static var openAppWhenRun = true

    @Parameter(title: "Section")
    var section: StreamsSection

    // 🔑 REQUIRED initializer
    init(section: StreamsSection) {
        self.section = section
    }

    func perform() async throws -> some IntentResult {
        let url = URL(string: "streams://\(section.rawValue)")!
        await MainActor.run {
            UIApplication.shared.open(url)
        }
        return .result()
    }
}
