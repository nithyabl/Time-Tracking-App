class StringConstants {
  static const appName = "Time Tracking App";
  static const connectInternet = 'You are Offline. Please connect to internet';
  static const somethingWentWrongError =
      'Something went wrong, please try again later.';
  static const String firstCharacterSpaceError =
      'First character cannot be a space';
  static const String checkInternet = 'Check Internet';
  static const String home = 'Home';
  static const String menu = 'Menu';
  static const String back = 'Back';
  static const String noTasksAvailable = 'No tasks available';
  static const String noResultsFound = 'No results found';
  static const String noDataAvailable = 'No data available';
  static const String edit = 'Edit';
  static const String delete = 'Delete';
  static const String submit = 'Submit';
  static const String taskContent = 'Task content';
  static const String commentContent = 'Comment content';
  static const String taskDescription = 'Task description';
  static const String priority = 'Priority';
  static const String dueDateTime = 'Due Date and Time';
  static const String durationInHours = 'duration in hours';
  static const String durationInMinutes = 'duration in minutes';
  static const String taskContentRequired = 'Task content is required';
  static const String taskDescriptionRequired = 'Task description is required';
  static const String commentContentRequired = 'Comment is required';
  static const String selectPriority = 'Select priority';
  static const String editTask = 'Edit Task';
  static const String beginTask = 'Begin Task';
  static const String completeTask = 'Complete Task';
  static const String reopenTask = 'Reopen Task';
  static const String addComment = 'Add a comment';
  static const String updateComment = 'Update comment';
  static const String viewComments = 'View comments';
  static const String welcomeComma = 'Welcome,';
  static const String welcomeSummary =
      'Track time and manage your tasks efficiently.';
  static const String taskSummary = 'Task summary';
  static const String todo = 'To Do';
  static const String ongoing = 'Ongoing';
  static const String completed = 'Completed';
  static const String taskDetails = 'Task Details';
  static const String popupTitle = 'Confirm your activity';
  static const String popupSubTitle = 'Are you sure to proceed?';
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';
  static const String timeElapsed = 'Time elapsed';
  static const String timeSpent = 'Time spent';
  static const String timerClockBeginTimerMessage =
      'Begin task to start the timer';
  static const String generalInstructions = 'General Instructions';
  static const String changeThemMode = 'Change Theme';
  static const String darkMode = 'Dark Mode';
  static const String addNewTask = 'Add new task';
  static const String dark = 'dark';
  static const String light = 'light';
  static const String system = 'system';

  static const List<Map> generalInstructionAll = [
    {
      'heading': 'Task and Comments',
      'detail':
          'Adding, editing, or deleting tasks and comments requires a network connection. All other functionalities work locally.'
    },
    {
      'heading': 'To Do',
      'detail':
          "Newly created tasks appear in the 'To Do' section. Moving a task from 'To Do' to 'Ongoing' starts the timer. Moving a task from 'To Do' to 'Completed' closes the task without adding any time duration."
    },
    {
      'heading': 'Ongoing',
      'detail':
          "Once a user starts a task, the elapsed time is displayed. The user needs to tap on the task card to view it. Moving a task to 'Completed' closes it and updates the time spent on the task. Moving a task back to 'To Do' clears the recorded time, and the user must start the task again to restart the timer."
    },
    {
      'heading': 'Done',
      'detail':
          "The 'Done' section displays the time spent on each task. The user needs to tap on the task card to view it. Moving a task back to 'Ongoing' restarts the timer, and the previously recorded time will be lost. Moving a task back to 'To Do' also clears the recorded time spent on the task."
    },
    {
      'heading': 'Local Data Persistence:',
      'detail':
          "You will lose all data, including tasks moved from 'To Do' to other sections and the timer details for all tasks."
    },
  ];

  static const String nameFieldHintText = "Enter your text";
  static const String save = "Save";
  static const String nameFieldValidationMessage = "Please enter name";
  static const String editName = "Edit Name";
  static const String somethingWentWrong = "Something went wrong";
  static const String couldNotRefresh = "Couldn't Refresh";
  static const String couldNotLoadData = "Couldn't Load Data";
  static const String addTask = "Add Task";
  static const String taskPopUpTitle = "Task Name";
  static const String addDescription = "+ Add Description";
  static const String description = "Description";

  static const String comments = "Comments";

  static const String trackTime = "Track time:";
  static const String historyErrorMessage = "Couldn't update history";
  static const String completedTasks = "Completed Tasks";
  static const String noTasksToShow = "No tasks to show";
  static const String completedOn = "Completed on";
  static const String welcome = "Welcome";
  static const String trackTimeMessage =
      "Track time and manage your time efficiently";
  static const String createNewTask = "Create New Task";
  static const String taskName = "Task Name";
  static const String taskCannotBeEmpty = "Task name cannot be empty!";
}
