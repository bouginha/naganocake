# frozen_string_literal: true

module MemberDecorator

  def full_name
    first_name + last_name
  end
end