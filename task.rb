# create class Task
class Task
  # initialize the task so every task has a title, desc
  def initialize title, desc
    # set title to equal the input of title
    @title = title
    # set description to equal the input of desc
    @desc = desc
    # creating the variable to hold hash info name and values for task:
    @task_items = Hash.new
    # create a variable for done
    @done = false
    # create a variable for the due dates
    @due_date = ''
  end

  # return the title
  def title
    # the variable @title is available
    @title
  end

  # return the description
  def desc
    # the variable @desc is available
    @desc
  end

  # add the task and items to the Hash @task_items
  def add_task_items task, item
    # takes the arguments and adds them to the hash
    @task_items = { 'task' => task, 'item' => item}
  end

  # return the hash @task-items
  def task_items
    @task_items
  end

  # a method to mark the task done
  def mark_done yes
    # if the argument is 'yes'
    if yes == 'yes'
      # set @done to true
      @done = true
    else
      # set @done to false
      @done = false
    end
  end

  def done?
    # return the @done variable
    @done
  end
    
  # a method to print the status of a task
  def print_status
    # check to see if the task is done
    if @done == true
      # print 'title is complete'
      print @title.to_s + ' is complete'
      # returns 'title is complete'
      @title.to_s + ' is complete'
    else
      # print 'title is in progress'
      print @title.to_s + ' is in progress'
      # returns 'title is in progress'
      @title.to_s + ' is in progress'
    end
  end

  # return the status variable
  def status
    @status
  end

  # create a method to add a due date to a task, needs year, month and date input
  def set_due_date year, month, day
    # creates a variable for the due date and sets the date using the Ruby Date class
    @due_date = Date.new year, month, day
    # converts the due date to a string format that is easier to read
    @due_date = @due_date.strftime('%F')
  end

  # returns the due date variable
   due_date
    @due_date
  end

  # create a method to print the task with all of the details
  def print_task
    # prints the task details
    print 'Task title: ' + @title.to_s + ' Description: ' + @desc.to_s + ' Task: ' + @task_items['task'].to_s + ' Item: ' + @task_items['item'].to_s + ' Due date: ' + @due_date.to_s + '. '
    # returns the string output of all the task details
    @title.to_s + ' ' + @desc.to_s + ' ' + @task_items['task'].to_s + ' ' + @task_items['item'].to_s + ' ' + @due_date.to_s
  end
end # end of class
