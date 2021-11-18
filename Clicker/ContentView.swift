//
//  ContentView.swift
//  Clicker
//
//  Created by SofyanZ on 18/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var bestScore = 0
    // Quand l'application démarre, la partie n'est pas en cours
    @State var gameIsInProgress = false
    var body: some View {
        VStack {
            VStack {
                HStack {
                    if score >= bestScore && score != 0 {
                        Image (systemName: "flame")
                    }
                    Text("Score : \(score)")
                        .padding()
                }.font(.largeTitle)
            }
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        score = score + 1
                    }
            }
            Spacer()
            // ne pas afficher le bouton nouvelle partie si le jeu est en cours
            if gameIsInProgress == false {
                Button("Nouvelle partie") {
                    score = 0
                    gameIsInProgress = true
                    Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (_) in
                        gameIsInProgress = false
                        // si le score qu'on a fait est superieur au meilleur score, le meilleur score devient le score que l'on vient de faire
                        if score > bestScore {
                            bestScore = score
                        }
                    }
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
