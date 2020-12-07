class Api::V1::ChartsController < ApplicationController
  before_action :authenticate_user!

  ## Users
  def month_of_year_users
    render json: User.accessible_by(current_ability).group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end
  def free_member_roles
    render json: ({"Free" => User.count - User.with_role(:sysadmin).count - User.with_role(:superadmin).count - User.with_role(:admin).count - User.with_role(:member).count, "Members" => User.with_role(:member).count})
  end

  ## Articles
  def month_of_year_articles
    render json: Article.accessible_by(current_ability).group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end
  def free_member_articles
    render json: ({"Free" => Article.count - Article.where(user_id: User.with_role(:sysadmin)).count - Article.where(user_id: User.with_role(:superadmin)).count - Article.where(user_id: User.with_role(:admin)).count - Article.where(user_id: User.with_role(:member)).count, "Members" => Article.where(user_id: User.with_role(:member)).count})
  end

  ## Todo Items
  def complete_incomplete_todos
    render json: ({"Not Complete" => TodoItem.accessible_by(current_ability).where(complete: false).count, "Complete" => TodoItem.accessible_by(current_ability).where(complete: true).count})
    # render json: TodoItem.accessible_by(current_ability).group(:complete).count
  end
  def complete_incomplete_single_todos
    render json: ({"Not Complete" => current_user.todo_items.accessible_by(current_ability).where(complete: false).count, "Complete" => current_user.todo_items.accessible_by(current_ability).where(complete: true).count})
    # render json: current_user.todo_items.group(:complete).count
  end
  def month_of_year_todos
    render json: TodoItem.accessible_by(current_ability).group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end
  def month_of_year_single_todos
    render json: current_user.todo_items.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end
end