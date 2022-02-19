//
//  ContentView.swift
//  NadBot
//
//  Created by Nadia Ahmadian on 2022-02-19.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var messages :[String] = ["Welcome to Nad's Chat Bot 1.0"]
    var body: some View {
        VStack{
            HStack{
                Text("Nad Bot")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.mint)
            }
            ScrollView{
                ForEach(messages, id : \.self){ message in
                    if message.contains("[USER]"){
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack{
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.mint.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    }else{
                        HStack{
                            
                            Text(message)
                                .padding()
                                .background(.mint.opacity(0.2))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
            HStack{
                TextField("Talk to Nad", text: $messageText)
                    .padding()
                    .background(Color.mint.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                Button {
                    sendMessage(message: messageText)
                } label : {
                    Image(systemName: "paperplane.fill")
                        .tint(Color.mint)
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }
    func sendMessage(message : String){
        withAnimation{
            messages.append("[USER]"+message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
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
