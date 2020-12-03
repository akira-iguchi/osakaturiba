module RequestSpecHelper
  def sign_in(resource)
    user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper, type: :request
end
