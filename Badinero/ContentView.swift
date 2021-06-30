//
//  ContentView.swift
//  Badinero
//
//  Created by Julia Lanu on 24/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    var contacts: [Contact] = ContactList.allContacts
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.white),  Color("prettyGreen")]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Spacer()
                        Text("Hey buddy, how are you? Do you have any new updates for me?")
                            .font(.system(size: 15, weight: .medium, design: .default))
                            .padding(20)
                            .background(Color("prettyGreen"))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    Text("Upcoming Birthdays")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(Color("beige"))
                        .padding(.leading, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false)  {
                        HStack {
                            BirthdayView(birthdayPerson: "person-one")
                                .padding(.leading, 20)
                            BirthdayView(birthdayPerson: "person-two")
                            BirthdayView(birthdayPerson: "person-tree")
                            BirthdayView(birthdayPerson: "person-four")
                        }
                    }
                    
                    Text("Latest updates")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(Color("beige"))
                        .padding(.leading, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ExtractedView(highlightImage: "highlight-one")
                                .padding(.leading, 20)
                            ExtractedView(highlightImage: "highlight-two")
                        }
                    }
                    
                    // NOTIFICATIONS
                    
                    VStack(alignment: .center, spacing: 10){
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
                            content.title = "Hello there"
                            content.subtitle = "You haven't spoken to Angel in a while, mind sending her some love?"
                            content.sound = UNNotificationSound.default
                            
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                            
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            
                            UNUserNotificationCenter.current().add(request)
                        }
                    }
                    
                    
                    
                    Spacer()
                    
//                    TabView{
//                        Text("Hello")
//                            .tabItem {
//                                Image(systemName: "house")
//                                Text("Home")
//                            }
//
//                        Text("settings")
//                            .tabItem {
//                                Image(systemName: "person.crop.circle")
//                                Text("Home")
//                            }
//                    }
                    
                    NavigationLink(
                        destination: ContactView(),
                        label: {
                            CircleButton(color: .init("prettyGreen"), buttonImage: "person.crop.circle")
                        })
                    
                    
                }
                .navigationTitle(
                    Text("Welcome back")
                                
                )
            }
        }
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct BirthdayView: View {
    var birthdayPerson: String
    
    var body: some View {
        Image(birthdayPerson)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(10)
            .overlay(BirthdayShort(), alignment: .trailing)
    }
}


struct BirthdayShort: View {
    var body: some View {
        Spacer()
        Text("25/08")
            .font(.system(size: 14, weight: .bold))
            .frame(width: 90, height: 20, alignment: .trailing)
            .padding(.trailing, 10)
            .background(Color.black.opacity(0.5))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}


struct HighlightTitle: View {
    var body: some View{
        VStack{
            Spacer()
            Text("New job alert!")
                .font(.system(size: 14, weight: .bold))
                .frame(width: 170, height: 20, alignment: .trailing)
                .padding(.trailing, 10)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}

struct ExtractedView: View {
    var highlightImage: String
    
    var body: some View {
        Image(highlightImage)
            .resizable()
            .scaledToFill()
            .frame(width: 180, height: 100, alignment: .center)
            .cornerRadius(10)
            .overlay(HighlightTitle(), alignment: .trailing)
    }
}



struct CircleButton: View {
    
    var color: Color
    var buttonImage: String
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .padding(20)
                .shadow(color: .clear, radius: 3, x: 0.3, y: 0.3)
            Image(systemName: "\(buttonImage)")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.white)
                
        }
    }
}
