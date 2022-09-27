class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
    @schedules_count = Schedule.count
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
    if @schedule.save
        flash[:notice] = "スケジュールを登録しました。"
        redirect_to :schedules
    else
      flash[:alert] = "スケジュールを登録できませんでした。"       
      render "new"  
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
      flash[:notice] = "ID#{@schedule.id}の情報を更新しました。"
      redirect_to :schedules
    else
      flash[:alert] = "ID#{@schedule.id}の情報を更新できませんでした。"      
      render "edit"
    end
  end  

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:alert] = "スケジュールを削除しました。"
    redirect_to :schedules
  end

  
end
