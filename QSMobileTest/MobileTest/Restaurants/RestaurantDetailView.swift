//
//  RestaurantDetailView.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-13.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct ContactItem {
    let name, value: String
    let isSMS, isPhone, isEmail, isURL: Bool
}

struct AddressItem {
    let id, name, number, street, apartment, city, state, zipcode, country : String
}

enum SocialMediaType: Int, CaseIterable {
    case FB = 1, Twitter, Youtube
}


struct DayOfWeekItem {
    let id, name : String
    let openHours: OpenHours?
}

struct OpenHours {
    let from, to: String
}

struct RestaurantDetailView: View {
    // private let viewModel: RestaurantDetailViewModel
    @Environment(\.imageCache) var cache: ImageCache
    
    let imageUrl = URL(string: "https://s3.amazonaws.com/qsapi-files/files/49851e71-5114-4d94-9d9a-7f3cacb1764e/0f625c2f-7e01-4dd9-b569-f96c1c7b35f6.jpeg")!

    @State var contactInformation = [
        ContactItem(name: "PHONE NUMBER", value: "+1 (123) 456-7890", isSMS: true, isPhone: true, isEmail: false, isURL: false),
        ContactItem(name: "TROLL FREE NUMBER", value: "+1 (123) 456-7890", isSMS: true, isPhone: true, isEmail: false, isURL: false),
        ContactItem(name: "FAX NUMBER", value: "+1 (123) 456-7890", isSMS: false, isPhone: false, isEmail: false, isURL: false),
        ContactItem(name: "EMAIL ADDRESS", value: "email@email.com", isSMS: false, isPhone: false, isEmail: true, isURL: false),
        ContactItem(name: "WEBSITE", value: "www.google.com", isSMS: false, isPhone: false, isEmail: false, isURL: true),
    ]
    
    @State var addresses = [
        AddressItem(id: "ADDRESS1", name: "ADDRESS", number: "123", street: "Streetname", apartment: "Suite A", city: "Cityname", state: "ST", zipcode: "540789", country: "United States"),
        AddressItem(id: "ADDRESS2",name: "ADDRESS", number: "123", street: "Streetname", apartment: "Suite A", city: "Cityname", state: "ST", zipcode: "540789", country: "United States")
    ]
    
    @State var bizHours = [
        DayOfWeekItem(id: "1Sunday", name: "Sunday", openHours: OpenHours(from: "07 am", to: "07 pm")),
        DayOfWeekItem(id: "2Monday", name: "Monday", openHours: nil),
        DayOfWeekItem(id: "3Tuesday", name: "Tuesday", openHours: OpenHours(from: "07 am", to: "07 pm")),
        DayOfWeekItem(id: "4Wednesday", name: "Wednesday", openHours: OpenHours(from: "07 am", to: "07 pm")),
        DayOfWeekItem(id: "5Thursday", name: "Thursday", openHours: OpenHours(from: "07 am", to: "07 pm")),
        DayOfWeekItem(id: "6Friday", name: "Friday", openHours: OpenHours(from: "07 am", to: "07 pm")),
        DayOfWeekItem(id: "7Saturday", name: "Saturday", openHours: OpenHours(from: "07 am", to: "07 pm")),

    ]
    
    init(){//viewModel: RestaurantDetailViewModel) {
        //self.viewModel = viewModel
    }
      
     var body: some View {
        ScrollView {

        VStack(alignment: .leading) {
            remoteImage
            Text("Resource Title")
                    .font(.title)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                  .font(.body)

            List {
                contactSection
                addressSection
            }
            .listStyle(GroupedListStyle())
            .frame(height: 450)
            
            MapView(coordinate: CLLocationCoordinate2D.init(latitude:38.8951,longitude:-77.0364 ))
            .cornerRadius(25)
            .frame(height: 150)
            .disabled(true)
            List {
                notesSection
                socialMediaSection
                bizSection
            }
            .listStyle(GroupedListStyle())
            .frame(height: 350)
          
        }
        }

    }
}

private extension RestaurantDetailView {
    var contactSection: some View {
        Section(header: Text("CONTACT INFORMATION")) {
            ForEach(contactInformation, id:\.name) { contact in
                VStack {
                if (contact.isEmail) {
                    //NavigationLink(destination: MailComposerView()) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(contact.name)")
                                    .font(.footnote)
                                    .foregroundColor(Color.red)
                                   
                                Text("\(contact.value)")
                                    .font(.body)
                            }
                            Spacer()
                            Button(action:{}) {
                                Image(systemName: "envelope")
                            }
                        }
                    //}
                } else if (contact.isURL) {
                   //NavigationLink(destination: Browser()) {
                       HStack {
                           VStack(alignment: .leading) {
                               Text("\(contact.name)")
                                   .font(.footnote)
                                   .foregroundColor(Color.red)
                                  
                               Text("\(contact.value)")
                                   .font(.body)
                           }
                           Spacer()
                           Button(action:{}) {
                               Image(systemName: "envelope")
                           }
                       }
                   //}
               } else {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(contact.name)")
                                .font(.footnote)
                                .foregroundColor(Color.red)
                    
                            Text("\(contact.value)")
                                .font(.body)
                        }
                        Spacer()
                        if (contact.isSMS) {
                            Button(action:{}) {
                                Image(systemName: "message")
                            }
                        }
                        if (contact.isPhone) {
                            Button(action:{}) {
                                Image(systemName: "phone")
                            }
                        }
                    }.frame(height: 44)
                    .onTapGesture {
                       if let url = URL(string: "tel://1234567890"), UIApplication.shared.canOpenURL(url) {
                           if #available(iOS 10, *) {
                               UIApplication.shared.open(url)
                           } else {
                               UIApplication.shared.openURL(url)
                           }
                       }
                    
                    }
                }
                }
            }
        }
    }
    
    var addressSection: some View {
        Section(header: Text("ADDRESS")) {
            ForEach(addresses, id:\.id) { address in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(address.name)")
                            .font(.footnote)
                            .foregroundColor(Color.red)

                        Text("\(address.number) \(address.street), \(address.apartment)")
                            .font(.body)
                        Text("\(address.city), \(address.state) \(address.zipcode)")
                        .font(.body)
                        Text("\(address.country)")
                        .font(.body)
                    }
                    Spacer()
                    
                        Button(action:{}) {
                            Image(systemName: "mappin")
                        }
                    
                }
            }
        }
    }
    
    var notesSection: some View {
        Section(header: Text("NOTES")) {
            VStack(alignment: .leading) {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    .font(.body)
            }
        }
    }
    
    var socialMediaSection: some View {
        Section(header: Text("NOTES")) {
            HStack {
                ForEach(SocialMediaType.allCases, id:\.rawValue) { type in
                    Image("\(type)_f")
                }
            }
        }
    }
    
    var bizSection: some View {
        Section(header: Text("BUSINESS HOURS")) {
            VStack {
                ForEach(bizHours, id:\.id) { biz in
                    HStack {
                        Text("\(biz.name)")
                        Spacer()
                        if biz.openHours != nil {
                            Text("\(biz.openHours!.from) - \(biz.openHours!.to)")
                        } else {
                            Text("CLOSED")
                        }
                    }
                }
            }
        }
    }
    
    var remoteImage: some View {
        AsyncImage(url: imageUrl, placeholder: Text("Loading ..."), cache: self.cache, configuration: { $0.resizable() })
        .aspectRatio(contentMode: .fit)
    }
}

