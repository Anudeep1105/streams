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

    static var title: LocalizedStringResource = "Open Streams Section"
    static var openAppWhenRun: Bool = true

    @Parameter(title: "Section")
    var section: StreamsSection

    func perform() async throws -> some IntentResult {

        let urlString = "streams://\(section.rawValue)"

        await MainActor.run {
            if let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }

        return .result()
    }
}
