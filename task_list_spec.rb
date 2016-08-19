require 'rspec'
require_relative 'task_list'
require_relative 'task'

# I can create a Task.
describe TaskList do
  #  TaskList exists
  it 'should be a thing' do
    # new TaskList needs to exist
    expect { TaskList.new }.to_not raise_error
  end
  # create a new TaskList
  it 'should create a new Task_list called my_tasks' do
    # create a new TaskList called my_task_list
    my_task_list = TaskList.new
    # make my_task_list
    expect { my_task_list }.to_not raise_error
  end
  # TaskList contains tasks
  it 'can contain tasks' do
    # create a new TaskList
    my_task_list = TaskList.new
    # create a new task
    my_task = Task.new 'task 1', 'this is task 1 description'
    # add a task to my_task_list
    my_task_list.add_task my_task
    # my_task_list should contain my_task
    expect(my_task_list.contents).to include my_task
  end

  # with a TaskList, I can show all the completed items.
  it 'can show a list of completed tasks' do
    # create a new TaskList
    my_task_list = TaskList.new
    # create five new tasks
    task_one = Task.new 'shop', 'groceries'
    task_two = Task.new 'gym', 'go have a good work out'
    task_three = Task.new 'smile', 'have a happy day'
    task_four = Task.new 'read', 'study up for class tomorrow'
    task_five = Task.new 'sleep', 'get some sleep, you will feel better tomorrow'
    # mark some of the tasks completed
    task_one.mark_done 'yes'
    task_two.mark_done 'yes'
    task_three.mark_done 'yes'
    # add tasks to the TaskList
    my_task_list.add_task task_one
    my_task_list.add_task task_two
    my_task_list.add_task task_three
    my_task_list.add_task task_four
    my_task_list.add_task task_five
    # sort tasks to return the completed tasks
    my_task_list.show_completed_tasks
    # we want the tasks to return task_one, task_two and task_three
    expect(my_task_list.show_completed_tasks).to match_array [task_one, task_two, task_three]
  end
  # with a TaskList, I can show all the in progress items.
  it 'can show a list of in progress tasks' do
    # create a new TaskList
    my_task_list = TaskList.new
    # create five new tasks
    task_one = Task.new 'shop', 'groceries'
    task_two = Task.new 'gym', 'go have a good work out'
    task_three = Task.new 'smile', 'have a happy day'
    task_four = Task.new 'read', 'study up for class tomorrow'
    task_five = Task.new 'sleep', 'get some sleep, you will feel better tomorrow'
    # mark some of the tasks completed
    task_one.mark_done 'yes'
    task_two.mark_done 'yes'
    task_three.mark_done 'yes'
    # add tasks to the TaskList
    my_task_list.add_task task_one
    my_task_list.add_task task_two
    my_task_list.add_task task_three
    my_task_list.add_task task_four
    my_task_list.add_task task_five
    # sort tasks to return the in progress tasks
    my_task_list.show_in_progress_tasks
    # we want the tasks to return task_four, task_five
    expect(my_task_list.show_in_progress_tasks).to match_array [task_four, task_five]
  end

  # As a developer, I can add items with due dates to my TaskList.
  it 'task list can have items with due dates' do
    # create a new TaskList
    my_task_list = TaskList.new
    # create five new tasks
    task_one = Task.new 'shop', 'groceries'
    task_two = Task.new 'gym', 'go have a good work out'
    task_three = Task.new 'smile', 'have a happy day'
    task_four = Task.new 'read', 'study up for class tomorrow'
    task_five = Task.new 'sleep', 'get some sleep, you will feel better tomorrow'
    # set the due date for three tasks
    task_two.set_due_date 2016, 9, 22
    task_three.set_due_date 2016, 8, 20
    task_four.set_due_date 2016, 8, 29
    # add tasks to the TaskList
    my_task_list.create_task_with_duedates task_two
    my_task_list.create_task_with_duedates task_three
    my_task_list.create_task_with_duedates task_four

    # we want to see the tasks with due dates
    expect(my_task_list.task_with_duedates).to match_array [task_two, task_three, task_four]
  end
  # As a developer with a TaskList, I can list all the not completed items that are due today.
  it 'task list can contain due today that are not complete' do
    # creat a new TaskList
    my_task_list = TaskList.new
    # create five new tasks
    task_one = Task.new 'shop', 'groceries'
    task_two = Task.new 'gym', 'go have a good work out'
    task_three = Task.new 'smile', 'have a happy day'
    task_four = Task.new 'read', 'study up for class tomorrow'
    task_five = Task.new 'sleep', 'get some sleep, you will feel better tomorrow'
    # set the due date for three tasks
    task_one.set_due_date 2016, 8, 19
    task_two.set_due_date 2016, 8, 19
    task_three.set_due_date 2016, 8, 20
    task_four.set_due_date 2016, 8, 19
    task_five.set_due_date 2016, 8, 20
    # add tasks to the TaskList
    my_task_list.create_task_with_duedates task_one
    my_task_list.create_task_with_duedates task_two
    my_task_list.create_task_with_duedates task_three
    my_task_list.create_task_with_duedates task_four
    my_task_list.create_task_with_duedates task_five
    # sort tasks_with_due_dates so we see what is due today and not completed
    my_task_list.what_is_due_today
    # see tasks that are due today
    expect(my_task_list.due_today).to match_array [task_one, task_two, task_four]
  end

  # As a developer with a TaskList, I can list all the not completed items in order of due date.
  it 'task list items that are not done can be ordered by date' do
    # creat a new TaskList
    my_task_list = TaskList.new
    # create five new tasks
    task_one = Task.new 'shop', 'groceries'
    task_two = Task.new 'gym', 'go have a good work out'
    task_three = Task.new 'smile', 'have a happy day'
    task_four = Task.new 'read', 'study up for class tomorrow'
    task_five = Task.new 'sleep', 'get some sleep, you will feel better tomorrow'
    # set the due date for three tasks
    task_one.set_due_date 2016, 8, 19
    task_two.set_due_date 2016, 9, 19
    task_three.set_due_date 2016, 8, 20
    task_four.set_due_date 2016, 8, 29
    task_five.set_due_date 2016, 8, 25
    # add tasks to the TaskList
    my_task_list.create_task_with_duedates task_one
    my_task_list.create_task_with_duedates task_two
    my_task_list.create_task_with_duedates task_three
    my_task_list.create_task_with_duedates task_four
    my_task_list.create_task_with_duedates task_five
    # mark some of the tasks completed
    task_three.mark_done 'yes'
    task_two.mark_done 'yes'
    # sort tasks that are not done by order of date
    my_task_list.create_in_progress_by_date
    # we expect to see unfinished tasks in order of date
    expect(my_task_list.inprogress_by_date).to match_array [task_one, task_five, task_four]
  end

  # As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
  it 'all task list items that are not completed are sorted by due date' do
    # creat a new TaskList
    my_task_list = TaskList.new
    # create five new tasks
    task_one = Task.new 'shop', 'groceries'
    task_two = Task.new 'gym', 'go have a good work out'
    task_three = Task.new 'smile', 'have a happy day'
    task_four = Task.new 'read', 'study up for class tomorrow'
    task_five = Task.new 'sleep', 'get some sleep, you will feel bettertomorrow'
    # set the due date for three tasks
    task_one.set_due_date 2016, 8, 19
    task_two.set_due_date 2016, 9, 19
    task_three.set_due_date 2016, 8, 20
    # mark one of each type of the tasks completed
    task_three.mark_done 'yes'
    task_five.mark_done 'yes'
    # add tasks to the TaskList
    my_task_list.create_task_with_duedates task_one
    my_task_list.create_task_with_duedates task_two
    my_task_list.create_task_with_duedates task_three
    my_task_list.add_task task_four
    my_task_list.add_task task_five
    # sort tasks that are not done by date, if a task does not have a date, itshould be listed at the bottom
    my_task_list.create_in_progress_without_dates
    # we want an array with in progress tasks sorted by date, with no dates atthe bottom
    expect(my_task_list.in_progress_without_dates).to match_array [task_one, task_two, task_four]
  end
end
