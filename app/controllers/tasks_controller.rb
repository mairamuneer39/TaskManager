class TasksController < ApplicationController
  
  load_and_authorize_resource
  def index
      @tasks = @tasks.paginate(page: params[:page], per_page: 1)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    byebug
    @task = Task.new(task_params)
    respond_to do |format|
        if @task.save
          format.html { redirect_to @task, notice: 'Task was successfully created.' }
        else
          format.html { render :new }
        end
      end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @task.destroy
        format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      else
        format.html { redirect_to tasks_url, notice: 'Task cannot destroy!' }
      end
    end
  end

  def start
    respond_to do |format|
      if @task.update(start_date: Date.today, status:"In Progress")
        format.html { redirect_to @task, notice: "You have changed task's status to In Progress." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def end
    respond_to do |format|
      if @task.update(status:"Completed")
        format.html { redirect_to @task, notice: "You have changed task's status to In Progress." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :priority, :due_date, :start_date, :assigned_to_id, :status, :done, :time_spent)
    end


end
