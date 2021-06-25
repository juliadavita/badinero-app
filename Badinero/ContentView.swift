//
//  ContentView.swift
//  Badinero
//
//  Created by Julia Lanu on 24/06/2021.
//

import SwiftUI

struct ContentView: View {
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
                        Text("It's been a while Claire, how are you? Do you have any new updates for me?")
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
                            ExtractedView(highlightImage: "highlight-two")
                        }
                    }
                    
                    Spacer()
                    
                }
                .navigationTitle(Text("Welcome Back"))
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

struct HighlightTitle: View {
    var body: some View{
        VStack{
            Spacer()
            Text("Just got married")
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
