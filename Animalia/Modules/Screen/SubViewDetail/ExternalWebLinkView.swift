//
//  ExternalWebLinkView.swift
//  Animalia
//
//  Created by User50 on 29/04/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: AnimalModel
    var body: some View {
        GroupBox {
            HStack {
                
                
                Group {
                    //  Link(animal.name,destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                    Image(systemName: "globe")
                    Text("Wikipedia")
                    
                    Spacer()
                    let destination = URL(string: animal.link)
                    let wikipedia = URL(string:"https://wikipedia.org")!
                    
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name,destination: destination ?? wikipedia)
                }
            }
        }
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return ExternalWebLinkView(animal: animals[1])
}
