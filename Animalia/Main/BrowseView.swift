//
//  ContentView.swift
//  Animalia
//
//  Created by User50 on 29/04/24.
//

import SwiftUI

struct BrowseView: View {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [
        GridItem(.flexible())
    ]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    
    
    // MARK: - FUNCTION GRID SWITCH
    func gridSwitch() {
        withAnimation (.easeIn){
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            
            gridColumn = gridLayout.count
            print("Grid Number: \(gridColumn)")
        }
        // TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.3x2"
        }
        
    }
    var body: some View {
        NavigationStack {
            Group {
               
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            
                            NavigationLink(destination: 
                                AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ScrollView(showsIndicators: false,content: {
                        LazyVGrid(columns: gridLayout, alignment: .center,spacing: 12,content: {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                                
                            }
                        })
                    })
                }
            }
            .navigationTitle("Animalia")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    HStack (spacing:16) {
                        // MARK: - LIST
                        Button {
                            withAnimation (.easeIn){
                                
                                print("List view is activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }
                            
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .primary : Color.accent)
                        }
                        
                        // MARK: - GRID
                        Button {
                            withAnimation(.smooth) {
                                print("Grid view is activated")
                                isGridViewActive = true
                                gridSwitch()
                                haptics.impactOccurred()
                            }
                            
                        } label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.accent : .primary)
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BrowseView()
}
