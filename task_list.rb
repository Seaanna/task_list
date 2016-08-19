# create a new class TaskList
class TaskList
    def initialize
      # create a new array for contents
      @contents = []
      # create a new array for tasks with due dates
      @contents_with_duedates = []
    end

    # add tasks to the @contents array
    def add_task task
      # shovel the task into the array @contents
      @contents << task
    end

    # returns the array @contents
    def contents
      @contents
    end

    # make method to show the tasks that are done
    def show_completed_tasks
      # select items from the @contents array that are completed
      @contents.select { |x| x.done? == true }
    end

    # make method to show the tasks that are not done
    def show_in_progress_tasks
      # select items from the @contents array that are not completed
      @contents.select { |x| x.done? == false }
    end

    # make a method to show tasks with due dates
    def create_task_with_duedates task
      # puts tasks with due dates into the contents with due dates array
      @contents_with_duedates << task
    end

    # return the array
    def task_with_duedates
      @contents_with_duedates
    end

    # make a method that shows task with due dates for today and not completed
    # Purpose: to create a method that will return an array of items due today that are not completed
    # make a method to show what is due today
    def what_is_due_today
      # create  a new array for what is due today
      @due_today = []
      # make a variable that is equal to todays date
      @today = Date.today.strftime('%F')
      # array needs to equal  contents_with_duedates that is sorted to be not done and due dates are today
      @due_today = @contents_with_duedates.select { |x| x.done? == false && x.due_date == @today }
    end

    # return the array
    def due_today
      @due_today
    end

    # As a developer with a TaskList, I can list all the not completed items in order of due date.
    def create_in_progress_by_date
      # make a variable that equals the array contents_with_duedates sorted not completed
      @in_progress = @contents_with_duedates.select { |x| x.done? == false }
      # new array needs to be sorted by due_date
      @inprogress_by_date = @in_progress.sort { |x, y| x.due_date <=> y.due_date }
    end

    # return  the array
    def inprogress_by_date
      @inprogress_by_date
    end

    # create a method that will sort completed tasks by date with tasks with no dates at the end
    def create_in_progress_without_dates
      # make a variable that equals the array contents_with_duedates sorted not completed
      @in_progress = @contents_with_duedates.select { |x| x.done? == false }
      # new array needs to be sorted by due_date
      @inprogress_by_date = @in_progress.sort { |x, y| x.due_date <=> y.due_date }
      @in_progress_no_date = @contents.select { |x| x.done? == false }
      @in_progress_without_dates = @inprogress_by_date.concat(@in_progress_no_date)
    end

    # return the array of in progress without dates
    def in_progress_without_dates
      @in_progress_without_dates
    end
end
