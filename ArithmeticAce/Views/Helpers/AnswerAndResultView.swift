//
//  AnswerAndResultView.swift
//  ArithmeticAce
//
//  Created by Mateo Elosua on 2022-02-15.
//

import SwiftUI

struct AnswerAndResultView: View {
    let answerChecked: Bool
    let answerCorrect: Bool
    
    // This property is modified by the textfield in this helper view and we want to send its value back to the source true
    @Binding var imputgiven: String
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                //        CONDITION      true  false
                    .opacity(answerCorrect == true ? 1.0 : 0.0)
                
                Image(systemName: "x.square")
                    .foregroundColor(.red)
                //        CONDITION1         AND     CONDITION2         true  false
                //       answerChecked = true     answerCorrect = false
                    .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
            }
            
            Spacer()
            
            TextField("",
                      text: $imputgiven)
                .multilineTextAlignment(.trailing)
        }

       
    }
}


    
