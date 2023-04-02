//
//  ContentView.swift
//  FirstIosApplication
//
//  Created by earl on 28.03.2023.
//

import SwiftUI

struct MineView : View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            FavoriteView()
                .tabItem() {
                    Label("Favorites", systemImage: "star")
            }
            FunFactsView()
                .tabItem() {
                    Label("Fun fact", systemImage: "hand.thumbsup")
                }
        }
    }
}

struct MineView_Previews : PreviewProvider {
    static var previews: some View {
        MineView()
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("All about")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)

            Text(information.name)
                .font(.title)
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct Info {
    let image: String
    let name: String
    let story: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let funFacts: [String]
}

let information = Info(
    image: "Placeholder",
    name: "Earl",
    story: "A story can be about anything you can dream up. There are no right answers, there is no one else.\n\nNeed some inspiration?\n• 🐶🐱🛶️🎭🎤🎧🎸\n• 🏄‍♀️🚵‍♀️🚴‍♀️⛵️🥾🏂⛷📚\n• ✍️🥖☕️🏋️‍♂️🚲🧗‍♀️ ",
    hobbies: ["bicycle", "ticket.fill", "book.fill"],
    foods: ["🥐", "🌮", "🍣"],
    colors: [Color.blue, Color.purple, Color.pink],
    funFacts: [
        "The femur is the longest and largest bone in the human body.",
        "The moon is 238,900 miles away.",
        "Prince’s last name was Nelson.",
        "503 new species were discovered in 2020.",
        "Ice is 9 percent less dense than liquid water.",
        "You can spell every number up to 1,000 without using the letter A.\n\n...one, two, three, four...ninety-nine...nine hundred ninety-nine 🧐",
        "A collection of hippos is called a bloat.",
        "White sand beaches are made of parrotfish poop.",
    ]
)
    

struct StoryView : View {
    var body: some View {
        VStack {
            Text("My story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            ScrollView {
                Text(information.story)
                    .font(.body)
                    .padding()
            }
        }
        .padding([.top, .bottom], 50)
    }
}

struct FavoriteView: View {
    var body: some View {
        VStack {
            
            Text("This is my favorite hobbies:")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            HStack {
                ForEach(information.hobbies, id: \.self) { hobby in
                    Image(systemName: hobby)
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 80)
                }
                .padding()
            }
            
            Text("Foods")
                .font(.body)
                .font(.callout)
                .padding()
            
            HStack {
                ForEach(information.foods, id: \.self) { food in
                    Text(food)
                        .font(.system(size: 48))
                }
            }
            .padding()
            
            Text("Favorite Colors")
            
            HStack {
                ForEach(information.colors, id: \.self) { color in
                    color
                        .frame(width: 70, height: 70)
                        .cornerRadius(15)
                }
                .padding()
            }
        }
    }
}

struct FunFactsView : View {
    @State private var funFact = ""
    var body: some View {
        VStack {
            Text("Fun fact")
                .font(.body)
                .fontWeight(.black)
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            Button("Show random fact") {
                funFact = information.funFacts.randomElement()!
            }
        }
        .padding()
    }
}
