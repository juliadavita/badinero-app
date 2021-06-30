////
////  BirthdayView.swift
////  Badinero
////
////  Created by Julia Lanu on 30/06/2021.
////
//
//import SwiftUI
//
//
//
//
//struct BirthdayView: View {
//
//    var contacts: [Contact] = ContactList.allContacts
//    var contact: Contact
//
//    var body: some View {
//        HStack{
//            ForEach(contacts.identified(by: \.id)) { contact in
//                BoxView()
//            }
//
//        }
//
//
//    }
//}
//
//struct BoxView: View {
//
//    var body: some View {
//        VStack{
//            Image("person-one")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 100, height: 100, alignment: .center)
//                .cornerRadius(10)
//            Text("Hello")
//                .font(.subheadline)
//        }
//
//    }
//}
//
//struct BirthdayView_Previews: PreviewProvider {
//    static var previews: some View {
//        BirthdayView()
//    }
//}
