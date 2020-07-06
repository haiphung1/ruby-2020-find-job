module Admin::UserAppliesHelper
  def get_span_class user_apply
    user_apply.pending? ? "warning" : "primary"
    if user_apply.pending?
      "warning"
    elsif user_apply.approved?
      "primary"
    else
      "danger"
    end
  end
end
