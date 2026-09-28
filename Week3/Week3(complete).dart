//week 3.dart
final List<Map<String, dynamic>> books = [
  {'title': 'Dart in Action', 'author': 'Ada', 'year': 2021,
   'copies': 3, 'tags': ['dart', 'programming']},
  {'title': 'Flutter Basics', 'author': 'Sam', 'year': 2023,
   'copies': 0, 'tags': ['flutter', 'mobile']},
  {'title': 'Clean Code', 'author': 'Martin', 'year': 2008,
   'copies': 2, 'tags': ['programming', 'design']},
  {'title': 'Algorithms', 'author': 'Knuth', 'year': 1968,
   'copies': 1, 'tags': ['programming', 'math']},
  {'title': 'UI Design', 'author': 'Nora', 'year': 2019,
   'copies': 4, 'tags': ['design', 'mobile']},
];
// Task 1.1: Positional parameters
double lateFee(int daysLate, double ratePerDay) => daysLate * ratePerDay;

// Task 1.2: Optional positional parameter
String formatTitle(String title, [String? author]) {
  if (author == null) return title;
  return '$title by$author';
}

// Task 1.3: Named parameters 
Map<String, dynamic> makeBook({
  required String title,
  required String author,
  int year = 2024,
  int copies = 1,
}) {
  return {
    'title': title,
    'author': author,
    'year': year,
    'copies': copies,
  };
}

// Task 1.4: Arrow function 
bool isClassic(int year) => year < 2000;
void main() async {
  part1();
  part2();
  part3();
  part4();
  part5();
  await part6();
}

void part1() {
  print('--- Part 1 ---');
  print('Late fee: ${lateFee(5, 0.5)}');
  print(formatTitle('Dart in Action'));
  print(formatTitle('Dart in Action', 'Ada'));
  print(makeBook(title: 'Clean Code', author: 'Martin'));
  print(makeBook(title: 'Algorithms', author: 'Knuth', year: 1968));
  print(isClassic(1968));
  print(isClassic(2021));
}

// Task 2.1: Passing a function as an argument
List<String> transformAll(List<String> items, String Function(String) fn) {
  return items.map(fn).toList();
}

// Task 2.2: A closure that remember
int Function() makeCounter() {
  int count = 0;
  return () {
    count++;
    return count;
  };
}

// Task 2.3: A closure with a parameter
double Function(int) makeFeeCalculator(double rate) {
  return (int days) => days * rate;
}

// Task 2.4: Recurson
int sumDigits(int n) {
  if (n < 10) return n;
  return (n % 10) + sumDigits(n ~/ 10);
}

//calling
void part2() {
  print('--- Part 2 ---');
// Task 2.1
  final titles = ['Dart in Action', 'Clean Code'];
  print(transformAll(titles, (s) { return s.toUpperCase(); }));
  print(transformAll(titles, (s) => '$s!'));
// Task 2.2
  final desk1 = makeCounter();
  final desk2 = makeCounter();
  print(desk1());
  print(desk1());
  print(desk1());
  print(desk2());
 // Task 2.3
  final studentFee = makeFeeCalculator(0.25);
  final staffFee = makeFeeCalculator(0.10);
  print('Student fee: ${studentFee(4)}');
  print('Staff fee: ${staffFee(4)}');
// Task 2.4
  print('Sum of digits: ${sumDigits(35)}');
}

// Task 3.4: Map
Map<String, int> buildStock() {
  return {
    for (var book in books)
      book['title'] as String: book['copies'] as int
  };
}

// Calling
void part3() {
  print('--- Part 3 ---');

// Task 3.1: map and where
  final titles = books.map((b) => b['title'] as String).toList();
  final availableTitles = books
      .where((b) => (b['copies'] as int) > 0)
      .map((b) => b['title'] as String)
      .toList();

  print('Titles: $titles');
  print('Available: $availableTitles');

// Task 3.2: reduce and fold
  final totalCopies = books.fold<int>(
    0,
    (sum, b) => sum + (b['copies'] as int),
  );
  final oldestYear = books
      .map((b) => b['year'] as int)
      .reduce((a, b) => a < b ? a : b);

  print('Total copies: $totalCopies');
  print('Oldest year: $oldestYear');

// Task 3.3: Sorting without damaging the original
  final sortedBooks = List.of(books)
    ..sort((a, b) => (a['year'] as int).compareTo(b['year'] as int));
  final titlesByYear = sortedBooks.map((b) => b['title'] as String).toList();

  print('By year: $titlesByYear');

// Task 3.4: Map (continue)
  final stock = buildStock();
  print('Stock: $stock');

  stock.forEach((title, copies) {
    if (copies == 0) {
      print('Out of stock: $title');
    }
  });

  print('Copies of Unknown: ${stock['Unknown'] ?? 0}');
// Task 3.5: Set 
  final Set<String> allTags = {
    for (var book in books) ...(book['tags'] as List<String>)
  };
  print('All tags: $allTags');

  var a = {'Dart in Action', 'Clean Code', 'Flutter Basics'};
  var b = {'Clean Code', 'Flutter Basics', 'Algorithms'};

  print('Union: ${a.union(b)}');
  print('Common: ${a.intersection(b)}');
  print('Only in A: ${a.difference(b)}');
}
// Task 4.1: Generic Class 
class Box<T> {
  T value;
  Box(this.value);
}

// Task 4.2: Generic Function 
T firstOr<T>(List<T> items, T fallback) {
  return items.isEmpty ? fallback : items.first;
}

// Task 4.3:Class with two type parameters
class Pair<A, B> {
  final A first;
  final B second;

  Pair(this.first, this.second);

  @override
  String toString() => '($first, $second)';
}

// calling
void part4() {
  print('--- Part 4 ---');

// Task 4.1: Generic Class Usage
  final intBox = Box<int>(5);
  final stringBox = Box<String>('dart');

  print('Box<int>: ${intBox.value}');
  print('Box<String>: ${stringBox.value}');

 
// intBox.value = 'hello';(wrong because string cant be assigned to integer , it will cause compiler error so thats why commenting it)

// Task 4.2: Generic Function Usage
  print(firstOr(['Dart in Action', 'Clean Code'], 'none'));
  print(firstOr<String>([], 'z'));

// Task 4.3: Two Type Parameters Usage
  print(Pair('Dart in Action', 3));
}
void part5() { print('--- Part 5 ---'); }
Future<void> part6() async { print('--- Part 6 ---'); }
// Task 5.1: Custom Exceptions
class BookNotFoundException implements Exception {
  final String title;
  BookNotFoundException(this.title);
}

class BookNotAvailableException implements Exception {
  final String title;
  BookNotAvailableException(this.title);
}

// Task 5.2: Throwing 
void checkOut(Map<String, int> stock, String title) {
  if (!stock.containsKey(title)) {
    throw BookNotFoundException(title);
  }
  if (stock[title]! <= 0) {
    throw BookNotAvailableException(title);
  }
  stock[title] = stock[title]! - 1;
}

// Task 5.4: built-in exception
Map<String, dynamic> findBook(String title) {
  return books.firstWhere((b) => b['title'] == title);
}
// --- calling
void part5() {
  print('--- Part 5 ---');

  // Task 5.3: try / on / catch / finally
  var stock = buildStock();
  var testTitles = ['Dart in Action', 'Flutter Basics', 'Unknown Book'];

  for (var title in testTitles) {
    try {
      checkOut(stock, title);
      print('Checked out: $title');
    } on BookNotAvailableException catch (e) {
      print('Sorry: "${e.title}" has no copies left');
    } on BookNotFoundException catch (e) {
      print('Not found: "${e.title}"');
    } finally {
      print('Transaction logged.');
    }
  }

  print('Copies left of Dart in Action: ${stock['Dart in Action']}');

  // Task 5.4: (continued)
  try {
    findBook('Missing');
  } on StateError {
    print('Search failed: no such book');
  }
}
// Task 6.1: Await a future
Future<String> fetchBookOfTheDay() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Dart in Action';
}

// Task 6.3: errors in async code
Future<String> fetchBroken() async {
  await Future.delayed(const Duration(milliseconds: 500));
  throw Exception('Server down');
}

// calling

Future<void> part6() async {
  print('--- Part 6 ---');
  print('Fetching...');

  // Task 6.1: Await the Future 
  final book = await fetchBookOfTheDay();
  print('Book of the day: $book');

  // Task 6.3:  Errors in async code 
  try {
    await fetchBroken();
  } catch (e) {
    print('Fetch failed: $e');
  }
}
/* 6.2 
With await: Execution pauses at that line until the Future completes, 

Without await: The expression executes immediately to the Future before it finishes executing, .*/
  REFLECTION ANSWERS
1. When to use fold over reduce:
Use fold when the list might be empty, because reduce crashes on empty lists.  Also use fold when you want an answer that is a different type than the items in the list.

2. What capturing a variable means:
It means an inner function remembers avariable from outside, even after the main function finishes running. In makeCounter, the variable 'count' was captured.

3. Why specific exception comes first:
Dart checks error handlers from top to bottom. A general catch (e) catches  all errors, so any specific error block placed after it will never run.

4. Why forgetting await still compiles: Without await, Dart gives you the receipt box (Future) right away instead of waiting for the real value inside. The code is valid Dart, but you get the box instead of the answer.
*/
