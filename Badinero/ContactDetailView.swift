//
//  ContactDetailView.swift
//  Badinero
//
//  Created by Julia Lanu on 29/06/2021.
//

import SwiftUI

struct ContactDetailView: View {
    
    @State private var firstName = ""
    @State private var surName = ""
    @State private var birthday = Date()
    @State private var since = Date()
    @State private var notification = false
    @State private var quantity = 1
    
    
    var contact: Contact
    
    var body: some View {
        
        
        NavigationView{
                    
            VStack{
                Image(contact.imageName)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(3.0)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 420, height: 230, alignment: .center)
                
                Text("\(contact.name) \(contact.surname)")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)

                    
                Form{
                    Section(header: Text("General info")){
                        DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                        DatePicker("Friends since", selection: $since, displayedComponents: .date)
                    }

                    Section(header: Text("Badinero")){
                        Toggle("Turn on notifications", isOn: $notification)
                            .toggleStyle(SwitchToggleStyle(tint: Color("prettyGreen")))
                        Stepper("Speak to", value: $quantity, in: 2...100)
                        Text("Set every \(quantity) week(s)")
                            Button("Request permission"){
                                UNUserNotificationCenter.current()
                                    .requestAuthorization(options: [.alert, .badge, .sound]) { succes, error in
                                        if succes {
                                            print("all set!")
                                        } else if let error = error {
                                            print(error.localizedDescription)
                                        }
                                    }
                            }

                            Button("Schedule notification"){
                                let content = UNMutableNotificationContent()
                                content.title = "I think \(contact.name) needs some attention"
                                content.body = "It's been a while since you two talked, let's change that!"
                                content.sound = UNNotificationSound.default

                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                UNUserNotificationCenter.current().add(request)
                            }
                    }
                    
                    
                }
                .edgesIgnoringSafeArea(.bottom)
                
            }
            .navigationBarHidden(true)
            .accentColor(Color("prettyGreen"))
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


