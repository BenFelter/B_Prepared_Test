class User {
  String name;
  String email;
  String phoneNumber;

  User({required this.name, required this.email, required this.phoneNumber});
}

class Announcement {
  String title;
  String description;
  User assignedBy;
  User assignedTo;
  DateTime sentDate;

  Announcement(
      {required this.title,
      required this.description,
      required this.assignedBy,
      required this.assignedTo,
      required this.sentDate});
}

class Task {
  String title;
  String description;
  User assignedBy;
  DateTime dueDate;

  Task(
      {required this.title,
      required this.description,
      required this.assignedBy,
      required this.dueDate});
}

class UserTask {
  Task task;
  User assignedTo;
  bool status;

  UserTask({
    required this.task,
    required this.assignedTo,
    required this.status,
  });
}

class Group {
  String name;
  List<User> members;
  List<User> leaders;

  Group({
    required this.name,
    required this.members,
    required this.leaders,
  });
}

class TestModels {
  User testUser = User(
      name: "Ben Felter",
      email: "benbfelter@gmail.com",
      phoneNumber: "650-390-4495");

  static List<Announcement> getAnnouncements() {
    return [
      Announcement(
        title: "Announcement 1",
        description:
            "This is the first announcement in the list of announcements that will be displayed on the home page.",
        assignedBy: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        assignedTo: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        sentDate: DateTime.now(),
      ),
      Announcement(
        title: "Announcement 1",
        description: "This is the first announcement",
        assignedBy: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        assignedTo: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        sentDate: DateTime.now(),
      ),
      Announcement(
        title: "Announcement 1",
        description: "This is the first announcement",
        assignedBy: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        assignedTo: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        sentDate: DateTime.now(),
      ),
      Announcement(
        title: "Announcement 1",
        description:
            "This is the first announcement in the list of announcements that will be displayed on the home page.",
        assignedBy: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        assignedTo: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        sentDate: DateTime.now(),
      ),
      Announcement(
        title: "Announcement 1",
        description:
            "This is the first announcement in the list of announcements that will be displayed on the home page.",
        assignedBy: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        assignedTo: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        sentDate: DateTime.now(),
      ),
      Announcement(
        title: "Announcement 1",
        description:
            "This is the first announcement in the list of announcements that will be displayed on the home page.",
        assignedBy: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        assignedTo: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        sentDate: DateTime.now(),
      ),
      Announcement(
        title: "Announcement 1",
        description:
            "This is the first announcement in the list of announcements that will be displayed on the home page.",
        assignedBy: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        assignedTo: User(
            name: "Ben Felter",
            email: "benbfelter@gmail.com",
            phoneNumber: "650-390-4495"),
        sentDate: DateTime.now(),
      ),
    ];
  }

  static List<Task> getTasks() {
    return [
      Task(
          title: "Task 1",
          description: "This is the first task",
          assignedBy: User(
              name: "Ben Felter",
              email: "benbfelter@gmail.com",
              phoneNumber: "650-390-4495"),
          dueDate: DateTime.now()),
      Task(
          title: "Task 1",
          description: "This is the first task",
          assignedBy: User(
              name: "Ben Felter",
              email: "benbfelter@gmail.com",
              phoneNumber: "650-390-4495"),
          dueDate: DateTime.now()),
      Task(
          title: "Task 1",
          description: "This is the first task",
          assignedBy: User(
              name: "Ben Felter",
              email: "benbfelter@gmail.com",
              phoneNumber: "650-390-4495"),
          dueDate: DateTime.now()),
      Task(
          title: "Task 1",
          description: "This is the first task",
          assignedBy: User(
              name: "Ben Felter",
              email: "benbfelter@gmail.com",
              phoneNumber: "650-390-4495"),
          dueDate: DateTime.now()),
    ];
  }
}
