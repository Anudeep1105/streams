//
//  ChatRepository.swift
//  streams
//
//  Created by Anudeep Reddy on 30/01/26.
//

struct ChatRepository {

    static func fetchChats() -> [PageItem] {
        return [
            PageItem(title: "Sam",  subtitle: "Last Message", time: "10:20 PM", isChat: true,status: " ⚪ On Mobile"),
            PageItem(title: "India", subtitle: "Last Message", time: "11:45 PM", isChat: true,status: "Company Team"),
            PageItem(title: "Ben Ten",  subtitle: "Hey", time: "10:40 AM", isChat: true,status: " 📴 OFFLINE"),
            PageItem(title: "Dora", subtitle: "Hello", time: "Yesterday", isChat: true,status: " ⚪ WFH"),
            PageItem(title: "Nat",  subtitle: "Last Message", time: "10:20 PM", isChat: true,status: "⚪ On Mobile"),
            PageItem(title: "Apple", subtitle: "Last Message", time: "11:45 PM", isChat: true,status: " ⚪ On Desktop"),
            PageItem(title: "John",  subtitle: "Hey", time: "Last Month", isChat: true,status: " 📴 OFFLINE"),
            PageItem(title: "Interns", subtitle: "Hello", time: "1:05 PM", isChat: true,status: "Private Team"),
            PageItem(title: "Raj vardhan", subtitle: "HI", time: "Last Year", isChat: true,status: " Went To Break")
        ]
    }
}

