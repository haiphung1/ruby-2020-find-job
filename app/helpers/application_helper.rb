module ApplicationHelper
  def status_profiles profile
    profile.public_cv? ? t("public") : t("private") 
  end
  
  def user_apply? post
    current_user.user_applies.post_applies(post).present?
  end

  def qualification_time qualification
    return if qualification.start_time.blank?

    end_time = qualification.end_time || t("until_now")
    [l(qualification.start_time), end_time].join(" - ")
  end
end
