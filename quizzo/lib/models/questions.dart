class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

final List sample_data = [
  {
    "id": 1,
    "question":
        "Which planet is known as the Red Planet?",
    "options": ['Earth', 'Mars', 'Venus', 'Jupiter'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Who painted the Mona Lisa?",
    "options": ['Vincent van Gogh', 'Leonardo da Vinci', 'Pablo Picasso', 'Michelangelo'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Which is the largest ocean on Earth?",
    "options": ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Who wrote the play 'Romeo and Juliet'?",
    "options": ['William Shakespeare', 'Jane Austen', 'Charles Dickens', 'Emily Bronte'],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "Which country is known as the Land of the Rising Sun?",
    "options": ['China', 'Japan', 'South Korea', 'Thailand'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Who discovered penicillin?",
    "options": ['Alexander Fleming', 'Marie Curie', 'Isaac Newton', 'Louis Pasteur'],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "Which bird is the symbol of peace?",
    "options": ['Crow', 'Eagle', 'Pigeon', 'Dove'],
    "answer_index": 3,
  },
  {
    "id": 8,
    "question": "Which instrument does a cartographer use?",
    "options": ['Telescope', 'Microscope', 'Thermometer', 'Map'],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question": "Who invented the telephone?",
    "options": ['Thomas Edison', 'Guglielmo Marconi', 'Alexander Graham Bell', 'Nikola Tesla'],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Which is the largest mammal?",
    "options": ['Elephant', 'Blue whale', 'Giraffe', 'Hippopotamus'],
    "answer_index": 1,
  },
];
