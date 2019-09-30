//
//  Emoji View.swift
//  DadJokes
//
//  Created by Joseph Caligiuri on 9/30/19.
//  Copyright © 2019 Joseph Caligiuri. All rights reserved.
//

import SwiftUI

struct Emoji_View: View {
    var rating: String
    
    var body: some View {
        switch rating {
        case "Sob":
            return Text("😭")
        case "Sigh":
            return Text("😅")
        case "Smirk":
            return Text("😏")
        default:
            return Text("😔")
        }
    }
    
    init(for rating: String) {
        self.rating = rating
    }
}

struct Emoji_View_Previews: PreviewProvider {
    static var previews: some View {
        Emoji_View(for: "Sob")
    }
}
