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
    @Environment(\.managedObjectContext) var moc
    @State private var showingPunchline = false
    @State private var dragAmount = CGSize.zero
    var joke: Joke
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    Text(self.joke.setup)
                        .font(.largeTitle)
                        .lineLimit(10)
                        .padding([.horizontal])
                    
                    Text(self.joke.punchline)
                        .font(.title)
                    .lineLimit(10)
                    .padding([.horizontal, .bottom])
                        .blur(radius: self.showingPunchline ? 0 : 6)
                        .opacity(self.showingPunchline ? 1 : 0.25)
                }
                .multilineTextAlignment(.center)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: .black, radius: 5, x: 0, y: 0))
                    .onTapGesture {
                        withAnimation {
                    self.showingPunchline.toggle()
                        }
                }
 .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) /
    10), axis: (x: 0, y: 1, z: 0))
            }
            Emoji_View(for: joke.rating)
                .font(.system(size: 72))
        }
        .frame(minHeight: 0, maxHeight: .infinity)
        .frame(width: 300)
        .offset(y: dragAmount.height)
    .gesture(
        DragGesture()
            .onChanged { self.dragAmount = $0.translation
    }
        .onEnded{ value in
            if self.dragAmount.height < -200 {
                withAnimation {
                    self.dragAmount = CGSize(width: 0, height: -1000)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.moc.delete(self.joke)
                        //try? self.moc.save()
                    }
                }
            } else {
                self.dragAmount = .zero
            }
        }
        )
        .animation(.spring())
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
