RSpec.shared_examples "login page" do
  it "redirect to login page" do
    expect(response).to redirect_to login_url
  end
end
