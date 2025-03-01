final String singularDefinition =
    'A singular noun refers to one person, place, thing, or idea';

final String singularDefinitionExample = 'Example: Cat, Book, Child.';

final String pluralDefinition =
    'A plural noun refers to more than one person, place, thing, or idea.';

final String pluralDefinitionExample = 'Example: Cats, Books, Children.';

final List<Map<String, String>> rules = [
  {
    'rule': '1. Add "s" to most nouns.',
    'example': 'Dog → Dogs, Book → Books',
  },
  {
    'rule': '2. Add "es" if the word ends in s, sh, ch, x, or z.',
    'example': 'Bus → Buses, Box → Boxes',
  },
  {
    'rule': '3. Replace "y" with "ies" if preceded by a consonant.',
    'example': 'Baby → Babies, Lady → Ladies',
  },
  {
    'rule': '4. Add "s" if the word ends with y preceded by a vowel.',
    'example': 'Toy → Toys, Key → Keys',
  },
  {
    'rule': '5. Replace "f" or "fe" with "ves".',
    'example': 'Leaf → Leaves, Wife → Wives',
  },
  {
    'rule': '6. Irregular Plurals (no fixed rules).',
    'example': 'Man → Men, Child → Children',
  },
];

final List<Map<String, String>> nounTableData = [
  {'singular': 'Cat', 'plural': 'Cats'},
  {'singular': 'Dog', 'plural': 'Dogs'},
  {'singular': 'Book', 'plural': 'Books'},
  {'singular': 'Bus', 'plural': 'Buses'},
  {'singular': 'Baby', 'plural': 'Babies'},
  {'singular': 'Toy', 'plural': 'Toys'},
  {'singular': 'Leaf', 'plural': 'Leaves'},
  {'singular': 'Child', 'plural': 'Children'},
  {'singular': 'Man', 'plural': 'Men'},
  {'singular': 'Woman', 'plural': 'Women'},
  {'singular': 'Mouse', 'plural': 'Mice'},
  {'singular': 'Goose', 'plural': 'Geese'},
  {'singular': 'Knife', 'plural': 'Knives'},
  {'singular': 'Wife', 'plural': 'Wives'},
  {'singular': 'Foot', 'plural': 'Feet'},
  {'singular': 'Fish', 'plural': 'Fish'},
  {'singular': 'Ox', 'plural': 'Oxen'},
  {'singular': 'Deer', 'plural': 'Deer'},
  {'singular': 'Box', 'plural': 'Boxes'},
  {'singular': 'Church', 'plural': 'Churches'},
  // Add more singular-plural pairs as needed
];


final Map<String, String> quizQuestions = {
  'Dog': 'Dogs',
  'Bus': 'Buses',
  'Baby': 'Babies',
  'Toy': 'Toys',
  'Leaf': 'Leaves',
  'Man': 'Men',
};