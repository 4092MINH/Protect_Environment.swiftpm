import SwiftUI

struct EcoTourismProctectionView: View {
    @State private var selectedAnswer: Int?
    @State private var isCorrect: Bool?
    @State private var questions: [Question]
    @State private var currentQuestionIndex = 0
    @State private var showingResult = false

    init() {
        // Randomly select 3 questions
        let allQuestions = questionBookletForQuiz
        var selectedQuestions: [Question] = []
        while selectedQuestions.count < 3 && allQuestions.count > 0 {
            let randomIndex = Int.random(in: 0..<allQuestions.count)
            selectedQuestions.append(allQuestions[randomIndex])
            
            // Ensure no duplicate questions
            var tempAllQuestions = allQuestions
            tempAllQuestions.remove(at: randomIndex)
            
        }

        _questions = State(initialValue: selectedQuestions)
    }

    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.97, blue: 1.0)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                if currentQuestionIndex < questions.count {
                    Text(questions[currentQuestionIndex].question) // Display current question
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.bottom)

                    ForEach(0..<questions[currentQuestionIndex].answer.count, id: \.self) { index in
                        Button(action: {
                            selectedAnswer = index
                            isCorrect = questions[currentQuestionIndex].answer[index].isCorrect
                            
                        }) {
                            Text(questions[currentQuestionIndex].answer[index].answer)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(getBackgroundColor(for: index))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        .disabled(selectedAnswer != nil)
                    }

                    if let isCorrect = isCorrect {
                        Text(isCorrect ? "Chính xác!" : "Sai rồi!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(isCorrect ? .green : .red)
                            .padding(.top)
                        
                        Button("Next Question") {
                            selectedAnswer = nil
                            currentQuestionIndex += 1
                            if currentQuestionIndex >= questions.count {
                                showingResult = true
                            }
                        }
                        .padding(.top)
                        .disabled(selectedAnswer == nil)
                    }

                } else {
                    Text("The game end") // Display when all questions are answered
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
            .padding(30)
            .alert("Game Over", isPresented: $showingResult) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("You have completed the quiz!")
            }

        }
    }


    private func getBackgroundColor(for index: Int) -> Color {
        if let selectedAnswer = selectedAnswer {
            if selectedAnswer == index {
                return isCorrect == true ? .green : .red
            } else {
                if questions[currentQuestionIndex].answer[index].isCorrect {
                    return .green // Show correct answer in green after choosing
                } else if questions[currentQuestionIndex].answer[selectedAnswer].isCorrect && index != selectedAnswer {
                    return Color(red: 0.2, green: 0.6, blue: 1.0)
                }
                else {
                    return selectedAnswer == index ? .red : Color(red: 0.2, green: 0.6, blue: 1.0)
                }
            }
        } else {
             return Color(red: 0.2, green: 0.6, blue: 1.0)
        }
    }
}
