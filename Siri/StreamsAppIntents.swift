import AppIntents

@available(iOS 16.0, *)
struct StreamsAppIntents: AppShortcutsProvider {

    static var appShortcuts: [AppShortcut] {
        return[
            AppShortcut(
                intent: makeIntent(.dialpad),
                phrases: [
                    "Open dialpad in ${applicationName}",
                    "Open dial pad in ${applicationName}"
                ],
                shortTitle: "Dialpad",
                systemImageName: "circle.grid.3x3"
            ),

            AppShortcut(
                intent: makeIntent(.contacts),
                phrases: [
                    "Open contacts in ${applicationName}"
                ],
                shortTitle: "Contacts",
                systemImageName: "person.crop.circle"
            ),

            AppShortcut(
                intent: makeIntent(.calls),
                phrases: [
                    "Open calls in ${applicationName}"
                ],
                shortTitle: "Calls",
                systemImageName: "phone"
            ),

            AppShortcut(
                intent: makeIntent(.voicemail),
                phrases: [
                    "Open voicemail in ${applicationName}"
                ],
                shortTitle: "Voicemail",
                systemImageName: "recordingtape"
            ),

            AppShortcut(
                intent: makeIntent(.sms),
                phrases: [
                    "Open sms in ${applicationName}",
                    "Open messages in ${applicationName}"
                ],
                shortTitle: "SMS",
                systemImageName: "message.fill"
            ),

            AppShortcut(
                intent: makeIntent(.fax),
                phrases: [
                    "Open fax in ${applicationName}"
                ],
                shortTitle: "Fax",
                systemImageName: "faxmachine"
            ),

            AppShortcut(
                intent: makeIntent(.smartbox),
                phrases: [
                    "Open smartbox in ${applicationName}"
                ],
                shortTitle: "SmartBox",
                systemImageName: "archivebox.fill"
            ),

            AppShortcut(
                intent: makeIntent(.connect),
                phrases: [
                    "Open connect in ${applicationName}"
                ],
                shortTitle: "Connect",
                systemImageName: "point.3.connected.trianglepath.dotted"
            ),

            AppShortcut(
                intent: makeIntent(.chats),
                phrases: [
                    "Open chats in ${applicationName}"
                ],
                shortTitle: "Chats",
                systemImageName: "message"
            )
        ]
    }

    // 🔥 THIS IS THE KEY FIX
    private static func makeIntent(_ section: StreamsSection) -> OpenStreamsSectionIntent {
        let intent = OpenStreamsSectionIntent()
        intent.section = section
        return intent
    }
}

