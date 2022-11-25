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
                // add a for each loop
                ForEach(messages, id: \.self) { message in
                    // created a check the if the message contains USERS
                    if message.contains("[USER]") {
                        // let new user
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        HStack {
                            // push the message to the right side
                            Spacer()
                            // customize text box
                            if #available(iOS 15.0, *) {
                                Text(newMessage)
                                // with padding
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.blue.opacity(0.8))
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    } else {
                        //customized the chat bot left side
                        HStack {
                            if #available(iOS 15.0, *) {
                                Text(message)
                                // with padding
                                    .padding()
                                    .background(.gray.opacity(0.15))
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                            } else {
                                // Fallback on earlier versions
                            }
                            Spacer()
                        }
                    }
                }
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
