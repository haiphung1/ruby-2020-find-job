module ApplicationHelper
  def status_profiles profile
    profile.public_cv? ? t("public") : t("private") 
  end
end
