class StudentsController < ApplicationController

    def new
        @student = Student.new
    end

    def update
        @student = Student.find(params[:id])
        @student.update(post_params(:first_name, :last_name))
        redirect_to @student
    end

    def create
        @student = Student.new(post_params(:first_name, :last_name))
        @student.save
        redirect_to @student
    end

    def show
        @student = Student.find_by_id(params[:id])
    end
    
    def edit
        @student = Student.find_by_id(params[:id])        
    end

    private 
    def post_params(*args)
        params.require(:student).permit(*args)
    end
end