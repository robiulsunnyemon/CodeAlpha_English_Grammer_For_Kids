final String tenseDefinition =
    'Tense refers to the time of an action or event, expressed by the verb.';

final List<Map<String, String>> tenseTypes = [
  {'type': 'Present Simple', 'example': 'He plays football every day.'},
  {'type': 'Present Continuous', 'example': 'He is playing football now.'},
  {'type': 'Present Perfect', 'example': 'He has played football before.'},
  {
    'type': 'Present Perfect Continuous',
    'example': 'He has been playing football for an hour.'
  },
  {'type': 'Past Simple', 'example': 'He played football yesterday.'},
  {
    'type': 'Past Continuous',
    'example': 'He was playing football when I called him.'
  },
  {
    'type': 'Past Perfect',
    'example': 'He had played football before he went home.'
  },
  {
    'type': 'Past Perfect Continuous',
    'example':
    'He had been playing football for two hours before the rain started.'
  },
  {'type': 'Future Simple', 'example': 'He will play football tomorrow.'},
  {
    'type': 'Future Continuous',
    'example': 'He will be playing football at this time tomorrow.'
  },
  {
    'type': 'Future Perfect',
    'example': 'He will have played football by noon.'
  },
  {
    'type': 'Future Perfect Continuous',
    'example':
    'He will have been playing football for three hours by the time you arrive.'
  },
];

final List<String> tenseRules = [
  'Tenses indicate the time of an action.',
  'Each tense has four forms: Simple, Continuous, Perfect, and Perfect Continuous.',
  'Present tense is used for current or habitual actions.',
  'Past tense is used for actions that happened before now.',
  'Future tense is used for actions that will happen later.',
];

final Map<String, List<Map<String, String>>> tenseForms = {
  'Present Tense': [
    {'type': 'Simple Present', 'structure': 'Subject + V1 + Object', 'example': 'She writes a letter.'},
    {'type': 'Present Continuous', 'structure': 'Subject + is/am/are + V1+ing + Object', 'example': 'She is writing a letter.'},
    {'type': 'Present Perfect', 'structure': 'Subject + has/have + V3 + Object', 'example': 'She has written a letter.'},
    {'type': 'Present Perfect Continuous', 'structure': 'Subject + has/have been + V1+ing + Object', 'example': 'She has been writing a letter.'},
  ],
  'Past Tense': [
    {'type': 'Simple Past', 'structure': 'Subject + V2 + Object', 'example': 'She wrote a letter.'},
    {'type': 'Past Continuous', 'structure': 'Subject + was/were + V1+ing + Object', 'example': 'She was writing a letter.'},
    {'type': 'Past Perfect', 'structure': 'Subject + had + V3 + Object', 'example': 'She had written a letter.'},
    {'type': 'Past Perfect Continuous', 'structure': 'Subject + had been + V1+ing + Object', 'example': 'She had been writing a letter.'},
  ],
  'Future Tense': [
    {'type': 'Simple Future', 'structure': 'Subject + will + V1 + Object', 'example': 'She will write a letter.'},
    {'type': 'Future Continuous', 'structure': 'Subject + will be + V1+ing + Object', 'example': 'She will be writing a letter.'},
    {'type': 'Future Perfect', 'structure': 'Subject + will have + V3 + Object', 'example': 'She will have written a letter.'},
    {'type': 'Future Perfect Continuous', 'structure': 'Subject + will have been + V1+ing + Object', 'example': 'She will have been writing a letter.'},
  ],
};

final List<Map<String, String>> quizQuestions = [
  {'question': 'Simple Present: She ___ (write) a letter.', 'answer': 'writes'},
  {'question': 'Present Continuous: She ___ (write) a letter now.', 'answer': 'is writing'},
  {'question': 'Present Perfect: She ___ (write) a letter.', 'answer': 'has written'},
  {'question': 'Simple Past: She ___ (write) a letter yesterday.', 'answer': 'wrote'},
  {'question': 'Past Continuous: She ___ (write) a letter when I arrived.', 'answer': 'was writing'},
  {'question': 'Simple Future: She ___ (write) a letter tomorrow.', 'answer': 'will write'},
];