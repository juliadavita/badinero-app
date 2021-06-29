//
//  ContactDetailView.swift
//  Badinero
//
//  Created by Julia Lanu on 29/06/2021.
//

import SwiftUI

struct ContactDetailView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthday = Date()
    @State private var since = Date()
    @State private var notification = false
    @State private var quantity = 1
    
    var contact: Contact
    
    var body: some View {
        VStack{
            Image(contact.imageName)
                .resizable()
                .scaledToFill()
                .frame(height:300)
                .cornerRadius(4)
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom, -30)
            
            Form{
                Section(header: Text("General info")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    DatePicker("Friends since", selection: $since, displayedComponents: .date)
                }

                Section(header: Text("Badinero")){
                    Toggle("Turn on notifications", isOn: $notification)
                        .toggleStyle(SwitchToggleStyle(tint: Color("prettyGreen")))
                    Stepper("Speak to", value: $quantity, in: 2...100)
                    Text("Set every \(quantity) week(s)")
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .toolbar{
                Button("Save", action: saveUser)
                    .accentColor(.black)
            }
            
        }
        
    }
    
    func saveUser(){
        print("User Saved")
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: ContactList.allContacts.first!)
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
