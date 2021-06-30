//
//  ContactView.swift
//  Badinero
//
//  Created by Julia Lanu on 24/06/2021.
//

import SwiftUI

struct ContactView: View {
    
    var contacts: [Contact] = ContactList.allContacts
    
    var body: some View {
        
            List(contacts, id:\.id){ contact in
                NavigationLink(
                    destination: ContactDetailView(contact: contact), label: {
                        Image(contact.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70, alignment: .center)
                        .cornerRadius(4)
                        .padding(.vertical, 4)
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("\(contact.name) \(contact.surname)")
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                
                            Text("Last spoken: \(contact.spoken)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    })
                    
                

            }
            .navigationTitle("Your contacts")
            .padding(.top, -20)
            

    }
    

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactView()
        }
    }
}
}
