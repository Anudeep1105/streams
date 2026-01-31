import AppIntents

@available(iOS 16.0, *)
struct StreamsAppIntents: AppShortcutsProvider {

    static var appShortcuts: [AppShortcut] {
        return [
            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .dialpad),
                phrases: [
                    "Open dialpad in \(.applicationName)",
                    "Open dial pad in \(.applicationName)"
                ],
                shortTitle: "Dialpad",
                systemImageName: "circle.grid.3x3"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .contacts),
                phrases: ["Open contacts in \(.applicationName)"],
                shortTitle: "Contacts",
                systemImageName: "person.crop.circle"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .calls),
                phrases: ["Open calls in \(.applicationName)"],
                shortTitle: "Calls",
                systemImageName: "phone"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .voicemail),
                phrases: ["Open voicemail in \(.applicationName)"],
                shortTitle: "Voicemail",
                systemImageName: "recordingtape"
            ),

            AppShortcut(
                intent: OpenStreamsSectionIntent(section: .sms),
                phrases: ["Open messages in \(.applicationName)"],
                shortTitle: "Messages",
                systemImageName: "message"
            )
        ]
    }
}
