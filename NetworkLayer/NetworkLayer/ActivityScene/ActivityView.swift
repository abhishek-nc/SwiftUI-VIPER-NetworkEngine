//
//  ContentView.swift
//  NetworkLayer
//
//  Created by Abhishek Chandrashekar on 08/05/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
    @State var activity : Activity?
    weak var presenter: ActivityInteractor?
    
    init() {
    }
    
    var body: some View {
        VStack {
            Text("T")
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}





