class SpecialIssuesController < ApplicationController

  def index
    @special_issues = SpecialIssue.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @special_issue = SpecialIssue.find(params[:id])
  end

  def new
    @special_issue = SpecialIssue.new
    @special_issue_categories = SpecialIssueCategory.all #新規コラム作成ページでselectボックスのに選択肢を表示させるため
    authorize! @special_issue
  end

  def edit
    @special_issue = SpecialIssue.find(params[:id])
    authorize! @special_issue
  end

  def create
    authorize! @special_issue
    @special_issue = SpecialIssue.new(special_issue_params)
    @special_issue.author = current_user
    @special_issue.created_at = Time.now
    if @special_issue.save
      redirect_to @special_issue, notice: "コラムを作成しました"
    else
      render "new"
    end
  end

  def update
    @special_issue = current_user.special_issues.find(params[:id])
    authorize! @special_issue
    @special_issue.assign_attributes(special_issue_params)
    if @special_issue.save
      redirect_to @special_issue, notice: "コラムを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @special_issue = SpecialIssue.find(params[:id])
    authorize! @special_issue
    @special_issue.destroy
    redirect_to :special_issues, notice: "削除しました"
  end

    private

    def special_issue_params
      params.require(:special_issue).permit(
        :major_title,
        :minor_title,
        :content,
        :special_issue_category_id,
        :is_display
      )
    end

end
