//
//  Contact.swift
//  SwiftUI-List-Starter
//
//  Created by Julia Lanu Allen on 29/06/21.
//

import Combine
import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let surname: String
    let spoken: String
    let birthday: String
    let url: URL
}

struct ContactList {
    
    static let allContacts = [
        Contact(imageName: "person-one",
              name: "Angel",
              surname: "Vanderwoodsen",
              spoken: "2 days ago",
              birthday: "18/01",
              url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
        
        Contact(imageName: "person-two",
                name: "Rachelle",
                surname: "Pho",
                spoken: "3 weeks ago",
                birthday: "23/01",
              url: URL(string: "https://youtu.be/aiXvvL1wNUc")!),
        
        Contact(imageName: "person-tree",
                name: "Riley",
                surname: "Tyrone",
                spoken: "4 weeks ago",
                birthday: "02/02",
              url: URL(string: "https://youtu.be/FtO5QT2D_H8")!),
              
        Contact(imageName: "person-four",
                name: "Melvin",
                surname: "Wan",
                spoken: "3 days ago",
                birthday: "14/04",
              url: URL(string: "https://youtu.be/DBWu6TnhLeY")!),
        
        Contact(imageName: "person-five",
              name: "Claire",
              surname: "Luna",
              spoken: "2 weeks ago",
              birthday: "17/04",
              url: URL(string: "https://youtu.be/EgpKu1tAVMY")!),
        
        Contact(imageName: "person-six",
                name: "Adrian",
                surname: "Anderson",
                spoken: "3 months ago",
                birthday: "01/05",
              url: URL(string: "https://youtu.be/aiXvvL1wNUc")!),
        
        Contact(imageName: "person-seven",
                name: "Carli",
                surname: "Yen",
                spoken: "3 weeks ago",
                birthday: "12/05",
              url: URL(string: "https://youtu.be/FtO5QT2D_H8")!),
              
        Contact(imageName: "person-eight",
                name: "Mary",
                surname: "Jones",
                spoken: "1 week ago",
                birthday: "07/07",
              url: URL(string: "https://youtu.be/DBWu6TnhLeY")!),
        
        Contact(imageName: "person-nine",
                name: "Sam",
                surname: "Ai",
                spoken: "1 day",
                birthday: "09/07",
              url: URL(string: "https://youtu.be/aiXvvL1wNUc")!),
        
        Contact(imageName: "person-ten",
                name: "Shiloh",
                surname: "Nguyen",
                spoken: "4 weeks ago",
                birthday: "09/10",
              url: URL(string: "https://youtu.be/FtO5QT2D_H8")!),
              
        Contact(imageName: "person-eleven",
                name: "Bertus",
                surname: "Janssen",
                spoken: "2 week ago",
                birthday: "10/10",
              url: URL(string: "https://youtu.be/DBWu6TnhLeY")!),
       
    ]
}
