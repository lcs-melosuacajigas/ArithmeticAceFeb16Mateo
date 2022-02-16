//
//  QuestionPresentationView.swift
//  ArithmeticAce
//
//  Created by Mateo Elosua on 2022-02-15.
//

import SwiftUI

struct QuestionPresentationView: View {
    
    //MARK: Stored properties
    let operation: String
    let firstvalue: Int
    let secondvalue: Int
    
    //MARK: Computed properties
    var body: some View {
        
        HStack {
            Text("\(operation)")
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(firstvalue)")
                Text("\(secondvalue)")
            }
        }

            }
}



