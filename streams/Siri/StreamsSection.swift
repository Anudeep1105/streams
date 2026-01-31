//
//  StreamsSection.swift
//  streams
//
//  Created by Anudeep Reddy on 31/01/26.
//
import AppIntents

@available(iOS 16.0, *)
enum StreamsSection: String, AppEnum {

    case chats
    case calls
    case voicemail
    case sms
    case fax
    case contacts
    case dialpad
    case smartbox
    case connect

    static var typeDisplayRepresentation =
        TypeDisplayRepresentation(name: "Streams Section")

    static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
        .chats: "Chats",
        .calls: "Calls",
        .voicemail: "Voicemail",
        .sms: "SMS",
        .fax: "Fax",
        .contacts: "Contacts",
        .dialpad: "Dialpad",
        .smartbox: "SmartBox",
        .connect: "Connect"
    ]
}
