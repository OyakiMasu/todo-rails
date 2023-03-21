class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        cookies[:email] = user.email
        render json: { data: user , message: "User created succesfully"}
    end

    def show 
        user = User.find(params[:id])
        render json: user
    end

    def update
        id = params[:id].to_i
        user = User.find(id)
        user.update(user_params)
        render json: { message: "User updated succesfully" }
    end

    def destroy
        id = params[:id].to_i
        user = User.find(id)
        user.destroy
        render json: { message: "User has been deleted!" }

    end

    def index
        render json: { data: User.all }
    end

    def login
        email = params[:email]
        user = User.find_by(email: email)

        # if user&.authenticate(params[:password])
        #     render json: { message: "authenticated" }
        # else
        #     render json: { message: "wrong combo" }
        # end


        if user
            authenticaed = user.authenticate(params[:password])
            # render json: { data: authenticaed}

            render json: { message: authenticaed ? 'authenticated': 'wrong combination'}, status: authenticaed ? :ok : :unauthorized
            # authenticaed ? render json: { message: " You are logged in succesfully "} : render json: { message: 'email/password do not match'}, status: :unauthorized
        else
            render json: { message: "User does not exist !" }, status: :unprocessable_entity
        end

        # session[:email] = email => Lift session to after user is authenticated
    end



    # TODO: delete, show_individual user, logout(session)

    private

    def user_params
        params.permit(:email, :password)
    end
end
