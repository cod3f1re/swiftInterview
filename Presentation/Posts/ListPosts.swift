//
//  ListPosts.swift
//  Example interview
//
//  Created by Abraham Rivera Rojas on 29/02/24.
//

import SwiftUI

struct ListPosts: View {
    
    @State var questions: ListQuestions = ListQuestions(items: [Question(score: 10, title: "Title")])

    @State var username: String = ""
    @State var password: String = ""
    

    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(questions.items) { question in
                    Text(question.title)
                        .font(.title)
                    Text("Score: " + question.score.formatted())
                }
                Button("Add new Item") {
                    questions.items.append(Question(score: 10, title: "Title"))
                }.buttonStyle(.borderedProminent)
                Button("Remove last Item") {
                    questions.items.removeLast()
                }.buttonStyle(.borderedProminent)
            }
            
            TextField("Username", text: $username)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding(8)
                .font(.headline)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(6)
                .padding(.horizontal, 60)
                .padding(.top, 40)
                .onChange(of: username, perform: { value in
                    print("Username value \(value)")
                })
            
            SecureField("Password", text: $password)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding(8)
                .font(.headline)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(6)
                .padding(.horizontal, 60)
                .onChange(of: password, perform: { value in
                    print("Password value \(value)")
                })
            
            HStack {
              Spacer()
                Button(
                    action: {
                        print("**********************")
                        print("👤: \(username) ")
                        print("🔑: \(password) ")
                        print("**********************")
                   }, label: {
                       Text("Iniciar Sesión".uppercased())
                           .font(.subheadline)
                           .fontWeight(.bold)
                           .foregroundColor(.white)
                           .padding()
                           .background(Color.red)
                           .cornerRadius(10)
                           .shadow(radius: 10)
                   }
                )
              Spacer()
            }
            
            Spacer()
        }
        .padding(20.0)
        .task {
            do {
                questions = try await performAPICall()
            } catch {
                
            }
        }
    }
    

}

#Preview {
    ListPosts()
}
