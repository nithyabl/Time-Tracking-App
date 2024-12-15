class GeneralInstructions {
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
      'heading': 'Completed',
      'detail':
          "The 'Completed' section displays the time spent on each task. The user needs to tap on the task card to view it. Moving a task back to 'Ongoing' restarts the timer, and the previously recorded time will be lost. Moving a task back to 'To Do' also clears the recorded time spent on the task."
    },
    {
      'heading': 'Local Data Persistence:',
      'detail':
          "You will lose all data, including tasks moved from 'To Do' to other sections and the timer details for all tasks."
    },
  ];
}
