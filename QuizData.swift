//
//  QuizData.swift
//  Protect_Environment
//
//  Created by Phan Nguyễn Khánh Minh on 11/2/25.
//

import Foundation
struct Answer: Equatable{
    var answer: String
    var isCorrect: Bool = false
}

struct Question {
    var question: String
    var answer: [Answer]
}

let questionBookletForQuiz = [
    Question(
        question: "How does over-tourism contribute to soil erosion in Sapa’s rice terraces?",
        answer: [
            Answer(answer: "By increasing foot traffic on unregulated trails, compacting the soil and making it more prone to erosion", isCorrect: true),
            Answer(answer: "By reducing rainfall, causing soil to dry out and crack"),
            Answer(answer: "By encouraging farmers to plant more rice, which strengthens the soil"),
            Answer(answer: "By preventing landslides through the weight of tourists"),
        ]
    ),
    Question(
        question: "What is the main environmental consequence of using motorbikes and tour buses for travel in Sapa?",
        answer: [
            Answer(answer: "They disturb local wildlife with noise pollution"),
            Answer(answer: "They emit carbon dioxide (CO2), contributing to air pollution and harming the local ecosystem", isCorrect: true),
            Answer(answer: "They make it easier for locals to access remote areas"),
            Answer(answer: "They create more job opportunities for locals"),
        ]
    ),
    Question(
        question: "Which of the following eco-friendly practices helps prevent plastic pollution in Sapa?",
        answer: [
            Answer(answer: "Bringing a reusable water bottle and refilling at local water stations instead of buying plastic bottles", isCorrect: true),
            Answer(answer: "Buying multiple plastic water bottles to stay hydrated"),
            Answer(answer: "Leaving plastic waste in designated areas without recycling"),
            Answer(answer: "Burning plastic waste to get rid of it quickly"),
        ]
    ),
    Question(
        question: "Why is it harmful for tourists to pick wildflowers or take plants as souvenirs from Sapa?",
        answer: [
            Answer(answer: "It disrupts the local ecosystem and reduces biodiversity", isCorrect: true),
            Answer(answer: "It helps spread Sapa's natural beauty to other places"),
            Answer(answer: "It prevents the plants from overgrowing"),
            Answer(answer: "It improves soil quality in the area"),
        ]
    ),
    Question(
        question: "Which of these actions can BEST help reduce deforestation in Sapa?",
        answer: [
            Answer(answer: "Choosing eco-friendly homestays and hotels that use sustainable wood sources", isCorrect: true),
            Answer(answer: "Camping in the forest without permission"),
            Answer(answer: "Supporting businesses that use disposable chopsticks and furniture made from rare trees"),
            Answer(answer: "Clearing small areas of forest to make new hiking trails"),
        ]
    ),
    Question(
        question: "What is the most environmentally friendly way to dispose of waste while trekking in Sapa?",
        answer: [
            Answer(answer: "Burying trash along the trails so it decomposes naturally"),
            Answer(answer: "Carrying all trash until a designated recycling or waste disposal station is available", isCorrect: true),
            Answer(answer: "Leaving trash in hidden spots where it won't be seen"),
            Answer(answer: "Throwing biodegradable waste directly into rivers and streams"),
        ]
    ),
    Question(
        question: "Why is it important for tourists to stay on designated trails while hiking in Sapa?",
        answer: [
            Answer(answer: "To prevent trampling on fragile plants and soil, reducing erosion and habitat destruction", isCorrect: true),
            Answer(answer: "To create shortcuts and explore new areas without harming the environment"),
            Answer(answer: "To take new trails that can later be used by locals"),
            Answer(answer: "To avoid getting lost"),
        ]
    ),
    Question(
        question: "How can tourists help protect Sapa's water sources from contamination?",
        answer: [
            Answer(answer: "By avoiding washing clothes, bathing, or using chemical-based soaps in streams and rivers", isCorrect: true),
            Answer(answer: "By dumping organic food waste into rivers, since it decomposes naturally"),
            Answer(answer: "By using any available water source without considering its cleanliness"),
            Answer(answer: "By carrying plastic water bottles and throwing them away when empty"),
        ]
    ),
    Question(
        question: "What is the best way to support the local community while also protecting the environment in Sapa?",
        answer: [
            Answer(answer: "Buying handmade souvenirs from local artisans instead of mass-produced plastic items", isCorrect: true),
            Answer(answer: "Buying as many cheap plastic souvenirs as possible"),
            Answer(answer: "Bringing food and supplies from home instead of purchasing from local businesses"),
            Answer(answer: "Only staying at international hotel chains"),
        ]
    ),
    Question(
        question: "Why should tourists avoid feeding wild animals in Sapa?",
        answer: [
            Answer(answer: "It disrupts the animals' natural behavior and makes them dependent on humans for food", isCorrect: true),
            Answer(answer: "It helps the animals grow stronger and healthier"),
            Answer(answer: "It allows tourists to interact more closely with wildlife"),
            Answer(answer: "It prevents the animals from hunting on their own"),
        ]
    )
]
