//
//  ContentView.swift
//  Badinero
//
//  Created by Julia Lanu on 24/06/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("beige"), Color("prettyGreen")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 20) {
                Text("Welcome back")
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .foregroundColor(Color("prettyGreen"))
                    .bold()
                    .padding(.vertical, 50)
                
                HStack() {
                    
                    BirthdayView(birthdayPerson: "person-one")
                    BirthdayView(birthdayPerson: "person-one")
                    BirthdayView(birthdayPerson: "person-one")
                    BirthdayView(birthdayPerson: "person-one")
                    
                }
                
                    
                
                Spacer()

                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BirthdayShort: View {
    var body: some View{
        VStack{
            Spacer()
            Text("25/08")
                .font(.system(size: 14, weight: .bold))
                .frame(width: 100, height: 20, alignment: .center)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
                .foregroundColor(.white)
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
