class StepsController < ApplicationController
  def index
    @steps = Step.all

    render("steps/index.html.erb")
  end

  def show
    @step = Step.find(params[:id])

    render("steps/show.html.erb")
  end

  def new
    @step = Step.new

    render("steps/new.html.erb")
  end

  def create
    @step = Step.new

    @step.recipe_id = params[:recipe_id]
    @step.step_number = params[:step_number]
    @step.direction = params[:direction]

    save_status = @step.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/steps/new", "/create_step"
        redirect_to("/steps")
      else
        redirect_back(:fallback_location => "/", :notice => "Step created successfully.")
      end
    else
      render("steps/new.html.erb")
    end
  end

  def edit
    @step = Step.find(params[:id])

    render("steps/edit.html.erb")
  end

  def update
    @step = Step.find(params[:id])

    @step.recipe_id = params[:recipe_id]
    @step.step_number = params[:step_number]
    @step.direction = params[:direction]

    save_status = @step.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/steps/#{@step.id}/edit", "/update_step"
        redirect_to("/steps/#{@step.id}", :notice => "Step updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Step updated successfully.")
      end
    else
      render("steps/edit.html.erb")
    end
  end

  def destroy
    @step = Step.find(params[:id])

    @step.destroy

    if URI(request.referer).path == "/steps/#{@step.id}"
      redirect_to("/", :notice => "Step deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Step deleted.")
    end
  end
end
