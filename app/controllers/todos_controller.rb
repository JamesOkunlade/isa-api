class TodosController < ApplicationController
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :status, :priority)
  end
end
