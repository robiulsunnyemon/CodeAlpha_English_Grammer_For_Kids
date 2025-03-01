final String definition =
    'Verb conjugation refers to the modification of a verb from its basic form to reflect various tenses, persons, or numbers.';

final String example =
    'Example: "I eat" (Present Tense), "I ate" (Past Tense), "I will eat" (Future Tense)';

final List<Map<String, String>> conjugationTable = [
  {'tense': 'Present', 'I': 'eat', 'You': 'eat', 'He/She/It': 'eats', 'We': 'eat', 'They': 'eat'},
  {'tense': 'Past', 'I': 'ate', 'You': 'ate', 'He/She/It': 'ate', 'We': 'ate', 'They': 'ate'},
  {'tense': 'Future', 'I': 'will eat', 'You': 'will eat', 'He/She/It': 'will eat', 'We': 'will eat', 'They': 'will eat'},
];

final List<String> rules = [
  'In the present tense, the verb may change slightly depending on the subject (e.g., "He eats" vs. "They eat").',
  'In the past tense, the verb usually takes the form of its past form (e.g., "ate" for "eat").',
  'In the future tense, "will" is used before the verb to indicate an action that will happen (e.g., "will eat").',
];

final Map<String, String> quizQuestions = {
  'Present Tense - I __ to the store.': 'go',
  'Past Tense - He __ to the park.': 'went',
  'Future Tense - They __ to the party.': 'will go',
};