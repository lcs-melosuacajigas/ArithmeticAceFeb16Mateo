//
//  SquareView.swift
//  ArithmeticAce
//
//  Created by Mateo Elosua on 2022-02-16.
//

import SwiftUI

struct SquareView: View {
    //MARK: Stored Properties
    @State var base = Int.random(in:1...6)
    @State var exponent = Int.random(in:2...5)
    
    @State var inputGiven = ""
    
    @State var answerChecked = false
    
    @State var answerCorrect = false
    
    //MARK: Computed Properties
    var correctProduct: Int {
        return base * base
    }
    var body: some View {
        VStack(spacing: 0) {

            QuestionPresentationView(operation: "x",
                                      firstvalue: base,
                                     secondvalue: exponent)
            Divider()
            
           
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
                          text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
            

    }
}
    
HStack {
        Button(action: {
            
            // Answer has been checked!
            answerChecked = true
            
            // Convert the input given to an integer, if possible
            guard let productGiven = Int(inputGiven) else {
                // Sadness, not a number
                answerCorrect = false
                return
            }
            
            // Check the answer!
            if productGiven == correctProduct {
                // Celebrate! 👍🏼
                answerCorrect = true
            } else {
                // Sadness, they gave a number, but it's correct 😭
                answerCorrect = false
            }
        }, label: {
            Text("Check Answer")
                .font(.largeTitle)
        })
            .padding()
            .buttonStyle(.bordered)
        // Only show this button when an answer has not been checked
            .opacity(answerChecked == false ? 1.0 : 0.0)
        
        Button(action: {
            // Generate a new question
            base = Int.random(in: 1...12)
            exponent = Int.random(in: 1...12)
            
            // Reset properties that track what's happening with the current question
            answerChecked = false
            answerCorrect = false
            
            // Reset the input field
            inputGiven = ""
        }, label: {
            Text("New question")
                .font(.largeTitle)
        })
            .padding()
            .buttonStyle(.bordered)
        // Only show this button when an answer has been checked
            .opacity(answerChecked == true ? 1.0 : 0.0)
        
    }
    
    // Reaction animation
    ZStack {
        LottieView(animationNamed: "51926-happy")
            .opacity(answerCorrect == true ? 1.0 : 0.0)
            .padding()

        LottieView(animationNamed: "91726-sad-guy-is-walking")
            .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
            .padding()
    }
    





struct SquareView_Previews: PreviewProvider {
static var previews: some View {
SquareView()
}
}




