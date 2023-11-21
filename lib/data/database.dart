class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNote = [
  Note(
      id: 0,
      title: "welcome to simple Note",
      content:
          'As I have mentioned it on the CV, I have BSc on Information Communications Technology with achievement of CGPA 3.45 and passed EXIT EXAM with 75% score. I adhere to work ethically and effectively interact with people across all level of the organization based on its interest.',
      modifiedTime: DateTime(2023, 1, 1, 34, 5)),
  Note(
      id: 1,
      title: "Hi Hello",
      content:
          'As I have mentioned it on the CV, I have BSc on Information Communications Technology with achievement of CGPA 3.45 and passed EXIT EXAM with 75% score. I adhere to work ethically and effectively interact with people across all level of the organization based on its interest.',
      modifiedTime: DateTime(2023, 1, 1, 34, 5)),
  Note(
      id: 2,
      title: "Delete me",
      content:
          'As I have mentioned it on the CV, I have BSc on Information Communications Technology with achievement of CGPA 3.45 and passed EXIT EXAM with 75% score. I adhere to work ethically and effectively interact with people across all level of the organization based on its interest.',
      modifiedTime: DateTime(2023, 1, 1, 34, 5)),
  Note(
      id: 3,
      title: "Update Me",
      content:
          'As I have mentioned it on the CV, I have BSc on Information Communications Technology with achievement of CGPA 3.45 and passed EXIT EXAM with 75% score. I adhere to work ethically and effectively interact with people across all level of the organization based on its interest.',
      modifiedTime: DateTime(2023, 1, 1, 34, 5)),
  Note(
      id: 4,
      title: "welcome to simple Note",
      content:
          'As I have mentioned it on the CV, I have BSc on Information Communications Technology with achievement of CGPA 3.45 and passed EXIT EXAM with 75% score. I adhere to work ethically and effectively interact with people across all level of the organization based on its interest.',
      modifiedTime: DateTime(2023, 1, 1, 34, 5)),
  Note(
      id: 5,
      title: "welcome to simple Note",
      content:
          'As I have mentioned it on the CV, I have BSc on Information Communications Technology with achievement of CGPA 3.45 and passed EXIT EXAM with 75% score. I adhere to work ethically and effectively interact with people across all level of the organization based on its interest.',
      modifiedTime: DateTime(2023, 1, 1, 34, 5)),
];
