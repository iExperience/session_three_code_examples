class UserDecorator
  attr_reader :user_model
  def initialize(user_model)
    @user_model = user_model
  end

  def handle
    "@#{user_model.handle}"
  end

  def method_missing(name)
    user_model.send(name)
  end
end