class SpecialIssuesController < ApplicationController

  def index
    @special_issues = SpecialIssue.with_rich_text_content.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @special_issue = SpecialIssue.find(params[:id])
    @special_issue_category = @special_issue.special_issue_category
  end

  def new
    @special_issue = SpecialIssue.new
    @special_issue_categories = SpecialIssueCategory.all #新規コラム作成ページでselectボックスに選択肢を表示させるため
    authorize!
  end

  def edit
    @special_issue = SpecialIssue.find(params[:id])
    authorize!
  end

  def create
    authorize!
    @special_issue = SpecialIssue.new(special_issue_params)
    @special_issue.author = current_user
    @special_issue.created_at = Time.now
    if @special_issue.save
      redirect_to @special_issue, notice: "コラム・ガイド情報を作成しました"
    else
      render "new"
    end
  end

  def update
    @special_issue = current_user.special_issues.find(params[:id])
    authorize!
    @special_issue.assign_attributes(special_issue_params)
    if @special_issue.save
      redirect_to @special_issue, notice: "コラム・ガイド情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @special_issue = SpecialIssue.find(params[:id])
    authorize!
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
