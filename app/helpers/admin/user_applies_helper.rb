module Admin::UserAppliesHelper
  def get_span_class user_apply
    user_apply.pending? ? "warning" : "primary"
  end
end
