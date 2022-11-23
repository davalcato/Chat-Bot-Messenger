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
    @State var messages: [String] = ["Welcome to Chat Bot"]
    
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
                if #available(iOS 15.0, *) {
                    TextField("Type something", text: $messageText)
                    // small text box with padding
                        .padding()
                    // change back ground color
                        .background(Color.gray.opacity(0.1))
                    // added corner radius
                        .cornerRadius(10)
                    // provide submit action
                        .onSubmit {
                            // add the functionality to send the messages
                            sendMessage(message: messageText)
                        }
                    
                } else {
                    // Fallback on earlier versions
                }
                Button {
                    // sendMessage
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                    
                }
                // size
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            // entire HStack has padding around it
            .padding()
        }
    }
    //  function called
    func sendMessage(message: String) {
        // each time you send a message add animation
        withAnimation {
            // append text
            messages.append("[USER]" + message)
            // send message call
            self.messageText = ""
        }
        // send bot message to simulate a 1 second delay on main thread
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // add animation
            withAnimation {
                messages.append(getBotResponse(message: message))
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
