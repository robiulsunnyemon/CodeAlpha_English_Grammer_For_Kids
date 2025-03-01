final String definition =
    'Subject-verb agreement refers to the grammatical rule that the subject and verb in a sentence must agree in number (singular/plural).';

final String example =
    'Example: "She runs every day." (The singular subject "She" agrees with the singular verb "runs.")';

final List<Map<String, String>> agreementTable = [
  {'subject': 'He', 'verb': 'runs'},
  {'subject': 'They', 'verb': 'run'},
  {'subject': 'I', 'verb': 'am'},
  {'subject': 'She', 'verb': 'is'},
  {'subject': 'We', 'verb': 'are'},
];

final List<String> rules = [
  'A singular subject takes a singular verb (e.g., She runs).',
  'A plural subject takes a plural verb (e.g., They run).',
  'Subjects joined by "and" take a plural verb (e.g., John and Jane run).',
  'Subjects joined by "or" take the verb that agrees with the subject closest to the verb (e.g., Either John or his friends are coming).',
];

final Map<String, String> quizQuestions = {
  'He __ to the market.': 'goes',
  'They __ to school.': 'go',
  'I __ a student.': 'am',
  'She __ a teacher.': 'is',
};