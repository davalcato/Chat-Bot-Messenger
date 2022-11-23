//
//  ContentView.swift
//  Chat-Bot
//
//  Created by Daval Cato on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    // variables
    @State private var messageText = ""
    // array of messages of type string
    @State var message: [String] = ["Welcome to Chat Bot"]
    
    var body: some View {
        VStack {
            HStack {
                Text("iBot")
                    .font(.largeTitle)
                    .bold()
                // add image
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                // logo for app
                    .foregroundColor(Color.blue)
            }
            // scrollview
            ScrollView {
                // add place holder for messages
                
                
            }
            // message bar
            HStack {
                // textfield
                TextField("Type something", text: $messageText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
