/// Prints a welcome tag for the application using given namw.
void printWelcome(String appName) {
  print('=== $appName ===');
}

String generateCode(String title) =>
    title.substring(0, 2).toUpperCase() + '101';

void main([List<String> args = const []]) {
  // part 1
  printWelcome('Course Roster Manager');

  // part 2
  const int maxCapacity = 4;
  final DateTime createdAt = DateTime.now();

  String courseTitle = 'CS201: Mobile App Development';

  // Part 8
  if (args.isNotEmpty) {
    courseTitle = args[0];
  }

  int capacity = maxCapacity;
  double creditHours = 3.0;
  bool isOpen = true;
  List<String> enrolledStudents = ['Aiden', 'Maria', 'Jamal'];
  Set<String> waitlist = {'Priya', 'Noah'};
  Map<String, int> attendanceCount = {'Aiden': 3, 'Maria': 4, 'Jamal': 2};

  print(
    'Course: $courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}',
  );

  //part 3
  String? instructorEmail;
  print('Instructor Email: ${instructorEmail ?? 'TBA'}');

  late String enrollmentCode;
  enrollmentCode = generateCode(courseTitle);
  print('Enrollment Code: $enrollmentCode');
  print('Instructor email length: ${instructorEmail?.length ?? 0}');

  // part 4
  String rawNames = ' Aiden , maria ,JAMAL , Priya ';
  List<String> cleanNames = [];
  for (String name in rawNames.split(',')) {
    cleanNames.add(name.trim());
  }
  print('Cleaned Names: $cleanNames');

  String courseDescription = '''
"Course Overview"
Title: $courseTitle
Credit Hours: $creditHours
Status: ${isOpen ? 'Open for Enrollment' : 'Closed'}
Created At: $createdAt
''';
  print(courseDescription);

  print('Seats left: ${capacity - enrolledStudents.length}');

  //part 5
  int fullGroups = enrolledStudents.length ~/ 3;
  int leftover = enrolledStudents.length % 3;
  print('Full groups of 3: $fullGroups, leftover: $leftover');

  Object formInput = 'twenty-two';
  if (formInput is String) {
    print('formInput is a String: "$formInput"');
  }
  if (formInput is! int) {
    print('formInput is NOT an int');
  }

  StringBuffer report = StringBuffer()
    ..write('Report: $courseTitle | ')
    ..write('Cap: $capacity | ')
    ..write('Roster: ${enrolledStudents.length}');
  print(report.toString());

  List<String>? extraNotes;
  extraNotes?..add('Room change pending');
  print('Extra notes: $extraNotes');

  int? bonusSeats;
  bonusSeats ??= 0;
  print('Bonus seats: $bonusSeats');

  //part 6
  if (isOpen && enrolledStudents.length < capacity) {
    print("You're in! Welcome.");
  } else {
    print('Enrollment is closed .');
  }

  int enrollmentStatusCode = 200;
  switch (enrollmentStatusCode) {
    case 200:
      print('Enrolled');
      break;
    case 404:
      print('Course not found');
      break;
    default:
      print('Unknown error');
      break;
  }

  String statusTag = isOpen ? 'OPEN' : 'FULL';
  print(statusTag);

  // part 7
  for (String student in enrolledStudents) {
    print(student);
  }

  attendanceCount.forEach((student, count) {
    print('$student: $count');
  });

  List<String> announcements = [
    'Welcome to $courseTitle',
    if (!isOpen) 'Course is FULL - waitlist open',
    for (var student in waitlist)
      'Reminder: $student, please confirm attendance',
  ];

  for (var announcement in announcements) {
    print(announcement);
  }

  // part 8 (continue)
  Set<String> secondWaitlist = {'Elena', 'Omar'};
  Set<String> mergedWaitlist = waitlist.union(secondWaitlist);
  print('Combined Waitlist: $mergedWaitlist');
}