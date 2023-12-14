//
//  SearchOptionsView.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

import SwiftUI

struct SearchOptionsView: View {
    
    let searchOptions =  ["Snell Library": "stethoscope", "Chemistry": "atom", "Mathmatics": "compass.drawing", "Marine": "tortoise.fill","Physics": "globe.central.south.asia","Psychology": "brain.filled.head.profile" ]
    
    let onSelected: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(searchOptions.sorted(by: <), id: \.0) { key, value in
                    Button(action: {
                        // action
                        onSelected(key)
                    }, label: {
                        HStack {
                            Image(systemName: value)
                            Text(key)
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 236/255, green: 240/255, blue: 241/255, opacity: 1.0))
                    .foregroundStyle(.black)
                    .padding(4)
                }
            }
        }
    }
}

#Preview {
    SearchOptionsView(onSelected: { _ in })
}
