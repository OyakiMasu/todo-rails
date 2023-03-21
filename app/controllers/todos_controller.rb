class TodosController < ApplicationController

    def get_todos
        email = session[:email]
        if email
            render json: Todo.all
        else
            render json: { message: "You are not authorized" }, status: :unauthorized
        end
    end

    # CREATE TODOS
    def create
        # title = todo_params[:title]
        # description = todo_params[:description]
        # priority = todo_params[:priority]

        # #Add todo in DB
        # todo = Todo.create(title: title, description: description, priority: priority)
        # render json: todo

        user = cookies[:email]

        if user
            todo = Todo.create(todo_params)
            if todo.valid?
                render json:todo, serializer: TodoSerializer
            else
                render json: todo.errors
            end

        else
            render json: { message: "You are not logged in !!" }, status: 401
        end



    end


    # UPDATE TODOS

    def update
        id = params[:id]
        todo = Todo.find(id.to_i)
        todo.update(todo_params)
        render json: { message: "Updated Todo succesfully"}

    end

    # TODO: Add delete method

    def destroy
        id = params[:id]
        todo = Todo.find(id.to_i)
        todo.destroy
        render json: { message: "Deleted Todo succesfully"}
    end

    private

    def todo_params
        params.permit(:title, :description, :priority, :status) 
    end

end
