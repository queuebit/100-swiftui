//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Paul Gagnon on 5/6/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct Headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func headlineStyle() -> some View {
        self.modifier(Headline())
    }
}


struct ContentView: View {
    let excerpt = """
    Its somewhat ambitious title was “The Book of Life,” and it attempted to show how much an observant man might learn by an accurate and systematic examination of all that came in his way. It struck me as being a remarkable mixture of shrewdness and of absurdity. The reasoning was close and intense, but the deductions appeared to me to be far-fetched and exaggerated. The writer claimed by a momentary expression, a twitch of a muscle or a glance of an eye, to fathom a man’s inmost thoughts. Deceit, according to him, was an impossibility in the case of one trained to observation and analysis. His conclusions were as infallible as so many propositions of Euclid. So startling would his results appear to the uninitiated that until they learned the processes by which he had arrived at them they might well consider him as a necromancer.

    “From a drop of water,” said the writer, “a logician could infer the possibility of an Atlantic or a Niagara without having seen or heard of one or the other. So all life is a great chain, the nature of which is known whenever we are shown a single link of it. Like all other arts, the Science of Deduction and Analysis is one which can only be acquired by long and patient study nor is life long enough to allow any mortal to attain the highest possible perfection in it. Before turning to those moral and mental aspects of the matter which present the greatest difficulties, let the enquirer begin by mastering more elementary problems. Let him, on meeting a fellow-mortal, learn at a glance to distinguish the history of the man, and the trade or profession to which he belongs. Puerile as such an exercise may seem, it sharpens the faculties of observation, and teaches one where to look and what to look for. By a man’s finger nails, by his coat-sleeve, by his boot, by his trouser knees, by the callosities of his forefinger and thumb, by his expression, by his shirt cuffs—by each of these things a man’s calling is plainly revealed. That all united should fail to enlighten the competent enquirer in any case is almost inconceivable.”
    """
    let chapterTitle = "Ch 2: The Science of Deduction"
    let bookTitle = "A Study in Scarlet"
    let bookAuthor = "Sir Arthur Conan Doyle"

    var body: some View {
        VStack {
            HStack {
                Text(bookTitle)
                    .italic()
                Text("by: \(bookAuthor)")
            }
            .font(.caption)
            Text(chapterTitle)
                // .modifier(Headline())
                .headlineStyle()
            Text(excerpt)
                .font(.body)
                .padding()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
