require 'rspec'
require_relative 'task_list'
require_relative 'task'

# I can create a Task.
describe TaskList do
  #  TaskList exists
  it "should be a thing" do
    # new TaskList needs to exist
    expect { TaskList.new }.to_not raise_error
  end
  # create a new TaskList
  it "should create a new Task_list called my_tasks" do
    # create a new TaskList called my_task_list
    my_task_list = TaskList.new
    # make my_task_list
    expect { my_task_list }.to_not raise_error
  end
 # TaskList contains tasks
  it "can contain tasks" do
    # create a new TaskList
    my_task_list = TaskList.new
    # create a new task
    my_task = Task.new "task 1", "this is task 1 description"
    # add a task to my_task_list
    my_task_list.add_task my_task
    # my_task_list should contain my_task
    expect(my_task_list.contents).to include my_task

  end

  # with a TaskList, I can show all the completed items.
  it "can show a list of completed tasks" do
    #create a new TaskList
    my_task_list = TaskList.new
    # create five new tasks
    task_one = Task.new "shop", "groceries"
    task_two = Task.new "gym", "go have a good work out"
    task_three = Task.new "smile", "have a happy day"
    task_four = Task.new "read", "study up for tomorrow's class"
    task_five = Task.new "sleep", "get some sleep, you'll feel better tomorrow"
    # mark some of the tasks completed
    task_one.mark_done "yes"
    task_two.mark_done "yes"
    task_three.mark_done "yes"
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
  it "can show a list of in progress tasks" do
    #create a new TaskList
    my_task_list = TaskList.new
    # create five new tasks
    task_one = Task.new "shop", "groceries"
    task_two = Task.new "gym", "go have a good work out"
    task_three = Task.new "smile", "have a happy day"
    task_four = Task.new "read", "study up for tomorrow's class"
    task_five = Task.new "sleep", "get some sleep, you'll feel better tomorrow"
    # mark some of the tasks completed
    task_one.mark_done "yes"
    task_two.mark_done "yes"
    task_three.mark_done "yes"
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

end
