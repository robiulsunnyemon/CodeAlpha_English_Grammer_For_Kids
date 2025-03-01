final String transitiveVerbDefinition =
    'A transitive verb is an action verb that requires one or more objects to complete its meaning.';

final String transitiveVerbExample =
    'Example: She **buys** a book. ("book" is the object of the verb "buys")';

final List<Map<String, String>> transitiveVerbTable = [
  {'verb': 'Buy', 'sentence': 'She buys a book.'},
  {'verb': 'Read', 'sentence': 'He reads a novel.'},
  {'verb': 'Write', 'sentence': 'She writes a letter.'},
  {'verb': 'Play', 'sentence': 'They play football.'},
  {'verb': 'Eat', 'sentence': 'He eats an apple.'},
];

final List<String> transitiveVerbRules = [
  'A transitive verb always requires an object.',
  'Ask "what?" or "whom?" after the verb to find the object.',
  'Without an object, the sentence will not make complete sense.',
  'Example: "She wrote." (Incomplete) vs "She wrote a letter." (Complete)',
];

final Map<String, String> quizQuestions = {
  'Buy': 'She buys ___.',
  'Read': 'He reads ___.',
  'Write': 'She writes ___.',
  'Play': 'They play ___.',
  'Eat': 'He eats ___.',
};