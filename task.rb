# create class Task
class Task
  # initialize the task so every task has a title, desc
  def initialize title, desc
    #set title to equal the input of title
    @title = title
    #set description to equal the input of desc
    @desc = desc
    #creating the variable to hold hash info name and values for task:
    @task_items = Hash.new
    # create a variable for done
    @done = false

  end
  # return the title
  def title
    # the variable @title is available
    @title
  end

  # return the description
  def desc
    #the variable @desc is available
    @desc
  end
  # add the task and items to the Hash @task_items
  def add_task_items task, item
    # takes the arguments and adds them to the hash
    @task_items = { "task" => task, "item" => item}
  end
  # return the hash @task-items
  def task_items
    @task_items
  end

  #a method to mark the task done
  def mark_done yes
    #if the argument is "yes"
    if yes == "yes"
      #set @done to true
      @done = true
    else
      #set @done to false
      @done = false
    end
  end
    def done?
      #return the @done variable
      @done
    end

    def print_status
      if @done == true
        print @title.to_s + " is complete"
        @title.to_s + " is complete"
      else
        print @title.to_s + " is in progress"
        @title.to_s + " is in progress"
      end
    end

    # return the status variable
    def status
      @status
    end

end #end of class
