//
//  AddView.swift
//  DadJokes
//
//  Created by Joseph Caligiuri on 9/30/19.
//  Copyright © 2019 Joseph Caligiuri. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var setup = ""
    @State var punchline = ""
    @State var rating = "Silence"
    let ratings = ["Sob", "Sigh", "Silence", "Smirk"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Setup", text: $setup)
                    TextField("punchline", text: $punchline)
                    Picker("Rating", selection: $rating) {
                    ForEach(ratings, id: \.self) { rating in Text(rating)
                            
                        }
                    }
               }
                
                Button("Add Joke") {
                    let newJoke = Joke(context: self.moc)
                    newJoke.setup = self.setup
                    newJoke.punchline = self.punchline
                    newJoke.rating = self.rating
                    
                    do {
                        try self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("whoops! \(error.localizedDescription)")
                    }
                }
            }.navigationBarTitle("New Joke")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
