class Admin::ProfilesController < Admin::AdminsController
  before_action :load_profile, only: %i(show)
  
  def index
    @q = Profile.ransack params[:q]
    by_ids = current_user.posts.pluck :id
    skill = Skill.where("skillable_id IN (?)", by_ids).pluck :title
    p = ProfileSkill.select(:profile_id).where("name IN (?)", skill).group(:profile_id)

    if params.blank?
      @profiles = Profile.where(["user_id IN (?) and status = ?", p, 1]).includes(:profile_skills)
      .page(params[:page]).per(9)
    else
      @profiles = @q.result.where("status = ?", 1).includes(:profile_skills).page(params[:page]).per(9)
    end
    # @profiles = Profile.where("user_id IN (?)", p1).order(created_at: :desc)
   
  end
  
  def show
    @experiences = @profile.experiences
    @qualifications = @profile.qualifications
  end

  private

  def load_profile
    @profile = Profile.find_by id: params[:id]
    return if @profile

    flash[:danger] = t "admin.profile.profile_not_found"
    redirect_to admin_root_url
  end
end
