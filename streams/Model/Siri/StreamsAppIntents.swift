//
//  StreamsAppIntents.swift
//  streams
//
//  Created by Anudeep Reddy on 31/01/26.
//
import AppIntents

@available(iOS 16.0, *)
struct StreamsAppIntents: AppShortcutsProvider {

    static var appShortcuts: [AppShortcut] {
        [

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .dialpad),
                phrases: [
                    "Open dialpad in ${applicationName}",
                    "Open dial pad in ${applicationName}"
                ],
                shortTitle: "Dialpad",
                systemImageName: "circle.grid.3x3"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .contacts),
                phrases: [
                    "Open contacts in ${applicationName}"
                ],
                shortTitle: "Contacts",
                systemImageName: "person.crop.circle"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .calls),
                phrases: [
                    "Open calls in ${applicationName}"
                ],
                shortTitle: "Calls",
                systemImageName: "phone"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .voicemail),
                phrases: [
                    "Open voicemail in ${applicationName}"
                ],
                shortTitle: "Voicemail",
                systemImageName: "recordingtape"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .sms),
                phrases: [
                    "Open sms in ${applicationName}",
                    "Open messages in ${applicationName}"
                ],
                shortTitle: "SMS",
                systemImageName: "message.fill"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .fax),
                phrases: [
                    "Open fax in ${applicationName}"
                ],
                shortTitle: "Fax",
                systemImageName: "faxmachine"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .smartbox),
                phrases: [
                    "Open smartbox in ${applicationName}"
                ],
                shortTitle: "SmartBox",
                systemImageName: "archivebox.fill"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .connect),
                phrases: [
                    "Open connect in ${applicationName}"
                ],
                shortTitle: "Connect",
                systemImageName: "point.3.connected.trianglepath.dotted"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .chats),
                phrases: [
                    "Open chats in ${applicationName}"
                ],
                shortTitle: "Chats",
                systemImageName: "message"
            )
        ]
    }
}
