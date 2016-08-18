require 'rspec'
require_relative 'task'

# I can create a Task.
describe Task do
  it "should be a thing" do
    expect { Task.new "task 1", "desc" }.to_not raise_error
  end


 # I can give a Task a title and retrieve it.
  it "should have a title" do
    my_task = Task.new "task 1", "this is a desc"
    expect(my_task.title).to eq "task 1"
  end

  # I can give a Task a description and retrieve it.
  it "should have a description" do
    my_task = Task.new "task 1", "this is task 1 description"
    #my_task.add_desc "this is task 1 description"
    expect(my_task.desc).to eq "this is task 1 description"
  end

  # I can print a Task with field labels and values.
  it "should have a field labels and value" do
    # create a new task
    my_task = Task.new "shopping", "we need to go to the grocery store"
    # creating new task, item to the @task_item Hash
    my_task.add_task_items "buy", "bananas"
    # we want the method to return the task
    expect(my_task.task_items["task"]).to eq "buy"
    # we want the method to return the item
    expect(my_task.task_items["item"]).to eq "bananas"
  end

  # As a developer, I can mark a Task done.
  it "should be marked done" do
    # create a new task
    my_task = Task.new "shopping", "buy groceries"
    # mark the task done
    my_task.mark_done "yes"
    # check to see if the task is done
    my_task.done?
    # we want the task to be marked done
    expect(my_task.done?).to be true
  end

  # As a developer, when I print a Task is done status is shown
  it "should print a status" do
    #create a new task
    my_task = Task.new "shopping", "buy groceries"
    #mark the task done
    my_task.mark_done "yes"
    # check to see if the task is done
    my_task.done?
    # print out the task status
    my_task.print_status
    # we want the task status to show "complete"
    expect(my_task.print_status).to include "complete"
  end
  # I can add all of my Tasks to a TaskList.
  



end
