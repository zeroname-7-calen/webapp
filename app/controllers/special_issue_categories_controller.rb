class SpecialIssueCategoriesController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @special_issue_categories = @user.special_issue_categories.order(created_at: :desc).page(params[:page]).per(20)
    else
      @special_issue_categories = SpecialIssueCategory.where.not(category_name: [
        SpecialIssueCategory::CATEGORY_NAME_PANTOSCOPIC_SPECTACLES,
        SpecialIssueCategory::CATEGORY_NAME_EVENTGUIDE,
        SpecialIssueCategory::CATEGORY_NAME_MOVIEGUIDE
        ])
        .order(created_at: :desc).page(params[:page]).per(20)
    end
  end

  def show
    @special_issue_category = SpecialIssueCategory.find(params[:id])
  end

  def new
    @special_issue_category = SpecialIssueCategory.new
    authorize!
  end

  def edit
    @special_issue_category = SpecialIssueCategory.find(params[:id])
    authorize!
  end

  def create
    authorize!
    @special_issue_category = SpecialIssueCategory.new(special_issue_category_params)
    @special_issue_category.created_at = Time.now
    if @special_issue_category.save
      redirect_to @special_issue_category, notice: "カテゴリーネームを作成しました"
    else
      render "new"
    end
  end

  def update
    @special_issue_category = SpecialIssueCategory.find(params[:id])
    @special_issue_category.assign_attributes(special_issue_category_params)
    authorize!
    if @special_issue_category.save
      redirect_to @special_issue_category, notice: "カテゴリーネームを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @special_issue_category = SpecialIssueCategory.find(params[:id])
    authorize!
    @special_issue_category.destroy
    redirect_to :special_issue_categories, notice: "削除しました"
  end

    private

    def special_issue_category_params
      params.require(:special_issue_category).permit(
        :category_name,
        :is_display,
        :priority,
        :image_name
      )
    end
end
