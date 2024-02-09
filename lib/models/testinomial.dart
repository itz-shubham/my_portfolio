import '../data/testinomial.dart';

class Testinomial {
  final String text, personName, personTitle;

  Testinomial({
    required this.text,
    required this.personName,
    required this.personTitle,
  });

  static List<Testinomial> getTestinomials() {
    return testinomialData
        .map((data) => Testinomial(
              text: data['text'],
              personName: data['personName'],
              personTitle: data['personTitle'],
            ))
        .toList();
  }
}
