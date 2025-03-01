final String degreeDefinition =
    'Degrees of Comparison are used to compare one thing with another.';

final String degreeExample =
    'Example: Positive - Tall, Comparative - Taller, Superlative - Tallest.';

final List<Map<String, String>> degreeTable = [
  {'positive': 'Tall', 'comparative': 'Taller', 'superlative': 'Tallest'},
  {'positive': 'Small', 'comparative': 'Smaller', 'superlative': 'Smallest'},
  {'positive': 'Good', 'comparative': 'Better', 'superlative': 'Best'},
  {'positive': 'Bad', 'comparative': 'Worse', 'superlative': 'Worst'},
  {
    'positive': 'Beautiful',
    'comparative': 'More Beautiful',
    'superlative': 'Most Beautiful'
  },
];

final List<String> degreeRules = [
  '1. For most one-syllable adjectives, add -er for comparative and -est for superlative. (e.g., Tall → Taller → Tallest)',
  '2. If the adjective ends in -e, just add -r for comparative and -st for superlative. (e.g., Large → Larger → Largest)',
  '3. If the adjective ends in a single consonant preceded by a single vowel, double the consonant before adding -er or -est. (e.g., Big → Bigger → Biggest)',
  '4. For adjectives with two or more syllables, use "more" for comparative and "most" for superlative. (e.g., Beautiful → More Beautiful → Most Beautiful)',
  '5. Some adjectives have irregular forms. (e.g., Good → Better → Best, Bad → Worse → Worst)',
];

final Map<String, String> quizQuestions = {
  'Tall': 'Taller',
  'Good': 'Better',
  'Bad': 'Worse',
  'Beautiful': 'More Beautiful',
  'Small': 'Smaller',
};