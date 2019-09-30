//
//  JokeCard.swift
//  DadJokes
//
//  Created by Joseph Caligiuri on 9/30/19.
//  Copyright © 2019 Joseph Caligiuri. All rights reserved.
//
import CoreData
import SwiftUI

struct JokeCard: View {
    var joke: Joke
    
    var body: some View {
        VStack {
            VStack {
                Text(self.joke.setup)
                    .font(.largeTitle)
                    .lineLimit(10)
                    .padding([.horizontal])
                
                Text(self.joke.punchline)
                    .font(.title)
                .lineLimit(10)
                .padding([.horizontal, .bottom])
            }
            .multilineTextAlignment(.center)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .shadow(color: .black, radius: 5, x: 0, y: 0))
            
            Emoji_View(for: joke.rating)
                .font(.system(size: 72))
        }
        .frame(minHeight: 0, maxHeight: .infinity)
        .frame(width: 300)
    }
}

struct JokeCard_Previews: PreviewProvider {
    static var previews: some View {
        let joke = Joke(context:
        NSManagedObjectContext(concurrencyType:
            .mainQueueConcurrencyType))
        
        joke.setup = "What happened to the italian chef?"
        joke.punchline = "He pasta way"
        joke.rating = "sigh"
        return JokeCard(joke: joke)
    }
}
