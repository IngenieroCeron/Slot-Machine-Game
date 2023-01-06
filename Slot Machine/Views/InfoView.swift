//
//  InfoView.swift
//  Slot Machine
//
//  Created by Eduardo Ceron on 27/09/22.
//

import SwiftUI

struct InfoView: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      LogoView()
      
      Spacer()
      
      Form {
        Section(header: Text("About the application")) {
          FormRowView(firstItem: "Aplicación", secondItem: "Slot Machine")
          FormRowView(firstItem: "Plataformas", secondItem: "iPhone, iPad, Mac")
          FormRowView(firstItem: "Developer", secondItem: "Ing. Ceron")
          FormRowView(firstItem: "Designer", secondItem: "Curso Udemy")
          FormRowView(firstItem: "Website", secondItem: "https://www.")
          FormRowView(firstItem: "Copyright", secondItem: "© All rights reserved.")
          FormRowView(firstItem: "Version", secondItem: "1.5.1")
        }
      }
      .font(.system(.body, design: .rounded))
    }
    .padding(.top, 40)
    .overlay(
      Button(action: {
        audioPlayer?.stop()
        self.presentationMode.wrappedValue.dismiss()
      }) {
        Image(systemName: "xmark.circle")
          .font(.title)
      }
      .padding(.top, 30)
      .padding(.trailing, 20)
      .accentColor(Color.secondary)
      , alignment: .topTrailing
      )
      .onAppear(perform: {
        playSound(sound: "background-music", type: "mp3")
      })
  }
}

struct FormRowView: View {
  var firstItem: String
  var secondItem: String
  
  var body: some View {
    HStack {
      Text(firstItem).foregroundColor(Color.gray)
      Spacer()
      Text(secondItem)
    }
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
      .previewDevice("iPhone 13")
  }
}
