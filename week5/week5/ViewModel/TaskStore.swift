//
//  TaskStore.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import Foundation
import Combine

/// A view model to manage the tasks.
class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
    
    @Published var addingTask = false
    init(_ loadData: Bool = true) {
        tasks.append(Task(title: "Buy groceries", isCompleted: false, notes: "milk, eggs, bread", category: .home))
        tasks.append(Task(title: "Walk the dog", isCompleted: false, notes: "at least twice",category: .home))
        tasks.append(Task(title: "Water the plants",isCompleted: true, notes: "water them all", category: .home))
        tasks.append(Task(title: "Read a chapter of a book",isCompleted: true, notes: "atlest 1 page", category: .personal))
        tasks.append(Task(title: "Schedule an appointment with client",isCompleted: true, notes: "for next week", category: .work))
        tasks.append(Task(title: "Answer emails",isCompleted: false, notes: "by 10am", category: .work))
        tasks.append(Task(title: "Workout for 30 minutes", isCompleted: true, notes: "every day", category: .personal))
        tasks.append(Task(title: "Wash the car",isCompleted: false, notes: "big one", category: .home))
        tasks.append(Task(title: "Clean the living room", isCompleted: false, notes: "with a broom", category: .home))
        tasks.append(Task(title: "Prepare agenda for the week", isCompleted: true, notes: "send to client", category: .work))
        tasks.append(Task(title: "Call mom",isCompleted: false, notes: "", category: .personal))
        tasks.append(Task(title: "Charge electronic devices", isCompleted: true, notes: "iphone, mac", category: .personal))
        tasks.append(Task(title: "Update the software", isCompleted: true, notes: "on mac", category: .work))
        tasks.append(Task(title: "Buy a birthday gift", isCompleted: true, notes: "a big one",category: .personal))
        tasks.append(Task(title: "Study for the certification", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Fix the leaky faucet", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Organize architecture notes", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Take out the trash", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Visit grandma",  isCompleted: false, notes: "",category: .personal))
        tasks.append(Task(title: "Do laundry", isCompleted: true, notes: "wash, dry", category: .home))
        tasks.append(Task(title: "Bake cookies", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Pay monthly bills", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Plan the weekend trip", isCompleted: false, notes: "and book flights",category: .personal))
        tasks.append(Task(title: "Attend the webinar", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Write technical specifications", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Mow the lawn", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Change light bulbs", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Return library books", isCompleted: true, notes: "will return tomorrow", category: .personal))
        tasks.append(Task(title: "Set up the planning meeting", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Paint bedroom", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Finish the project proposal", isCompleted: true, notes: "By the end of this week", category: .work))
        tasks.append(Task(title: "Book a restaurant for anniversary", isCompleted: false, notes: "", category: .personal))
        tasks.append(Task(title: "Recharge metro card", isCompleted: false, notes: "", category: .personal))
        tasks.append(Task(title: "Watch the latest training video", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Test the new software", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Renew Apple Developer program", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Volunteer at the local shelter", isCompleted: false, notes: "", category: .personal))
        tasks.append(Task(title: "Sign up for the yoga class", isCompleted: false, notes: "", category: .personal))
        tasks.append(Task(title: "Listen to the new podcast episode",  isCompleted: true, notes: "on Spotify",category: .personal))
        tasks.append(Task(title: "Mail the contracts", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Finish knitting the scarf", isCompleted: false, notes: "milk, eggs, bread", category: .home))
        tasks.append(Task(title: "Reorder printer ink", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Backup computer files", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Assemble the new furniture", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Donate old iPhones",isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Schedule a haircut", isCompleted: false, notes: "in Dukes barbour shop on Main", category: .personal))
        tasks.append(Task(title: "Review the business proposal", isCompleted: false, notes: "", category: .work))
        tasks.append(Task(title: "Edit the vacation photos", isCompleted: false, notes: "", category: .personal))
        tasks.append(Task(title: "Plant new flowers in the garden", isCompleted: false, notes: "", category: .home))
        tasks.append(Task(title: "Brush up on a foreign language",  isCompleted: false, notes: "watch more anime to learn japanese",category: .personal))
        
    }
 

    
    /// Adds a new task to the store.
    func addTask(title: String, notes: String, category: Category) {
        tasks.append(Task(title: title, isCompleted: false, notes: notes, category: category))
    }
}
