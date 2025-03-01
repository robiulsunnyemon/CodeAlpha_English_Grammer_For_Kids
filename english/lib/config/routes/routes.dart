import 'package:english/config/routes/routes_name.dart';
import 'package:english/features/article/page/article_page.dart';
import 'package:english/features/clause/page/clause_page.dart';
import 'package:english/features/degree/page/degree.dart';
import 'package:english/features/home/page/home_page.dart';
import 'package:english/features/part_of_speech/page/adverb/page/adverb_page.dart';
import 'package:english/features/part_of_speech/page/conjunction/page/conjunction_page.dart';
import 'package:english/features/part_of_speech/page/interjection/page/interjection_page.dart';
import 'package:english/features/part_of_speech/page/noun/page/noun_page.dart';
import 'package:english/features/part_of_speech/page/noun/singluler_plural_noun/page/singuler_plural_page.dart';
import 'package:english/features/part_of_speech/page/preposition/page/preposition_page.dart';
import 'package:english/features/part_of_speech/page/pronoun/page/pronoun_page.dart';
import 'package:english/features/part_of_speech/page/verb/page/conjugation_verb/page/conjugation_verb.dart';
import 'package:english/features/part_of_speech/page/verb/page/verb_page.dart';
import 'package:english/features/phrase/page/phrase_page.dart';
import 'package:english/features/sentence/page/sentence_page.dart';
import 'package:english/features/tense/page/tense_page.dart';
import 'package:flutter/material.dart';
import '../../features/part_of_speech/page/adjective/page/adjective_page.dart';
import '../../features/part_of_speech/page/noun/countable_uncountable_noun/page/countable_uncountable_page.dart';
import '../../features/part_of_speech/page/parts_of_speech.dart';
import '../../features/part_of_speech/page/verb/page/intransitive_verb/page/intransitive_verb_page.dart';
import '../../features/part_of_speech/page/verb/page/modal_verb/page/modal_verb_page.dart';
import '../../features/part_of_speech/page/verb/page/transitive_verb/page/transitive_verb_page.dart';
import '../../features/subject_verb_agreement/page/subject_verb_agreement.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.homeView:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());

      case RoutesName.partsOfSpeechPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  PartOfSpeechScreen());

      case RoutesName.nounPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  NounPage());

    case RoutesName.countableUncountableNounPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  CountableUncountableScreen());

   case RoutesName.singularPluralNounPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  SingularPluralScreen());

     case RoutesName.pronounPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  PronounPage());

     case RoutesName.adjectivePage:
        return MaterialPageRoute(builder: (BuildContext context) =>  AdjectivePage());

     case RoutesName.verbPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  VerbPage());

     case RoutesName.adverbPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  AdverbPage());

     case RoutesName.prepositionPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  PrepositionPage());

     case RoutesName.conjunctionPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  ConjunctionPage());

     case RoutesName.degreePage:
        return MaterialPageRoute(builder: (BuildContext context) =>  DegreeScreen());

     case RoutesName.transitiveVerbPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  TransitiveVerbScreen());

     case RoutesName.intransitiveVerbPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  IntransitiveVerbScreen());

     case RoutesName.modalVerbPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  ModalVerbScreen());

     case RoutesName.phrasePage:
        return MaterialPageRoute(builder: (BuildContext context) =>  PhraseScreen());

     case RoutesName.subjectVerbAgreementPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  SubjectVerbAgreementScreen());

     case RoutesName.conjugationVerbPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  VerbConjugationScreen());

     case RoutesName.articlePage:
        return MaterialPageRoute(builder: (BuildContext context) =>  ArticleScreen());

     case RoutesName.clausePage:
        return MaterialPageRoute(builder: (BuildContext context) =>  ClauseScreen());

     case RoutesName.sentencePage:
        return MaterialPageRoute(builder: (BuildContext context) =>  SentenceScreen());

     case RoutesName.tensePage:
        return MaterialPageRoute(builder: (BuildContext context) =>  TenseScreen());

     case RoutesName.interjectionPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  InterjectionPage());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}