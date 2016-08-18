# create a new class TaskList
class TaskList
    def initialize
      # create a new array for contents
      @contents = []
    end
    # add tasks to the @contents array
    def add_task task
      # shovel the task into the array @contents
      @contents<<task
    end
    # returns the array @contents
    def contents
      @contents
    end
    # make method to show the tasks that are done
    def show_completed_tasks
      # select items from the @contents array that are completed
      @contents.select {|x| x.done? == true}
    end
    # make method to show the tasks that are not done
    def show_in_progress_tasks
      # select items from the @contents array that are not completed
      @contents.select {|x| x.done? == false}
    end
end
