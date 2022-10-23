# frozen_string_literal: true

# Include this module in a model when you want to dynamically add
# methods suffixed with _in_dollars.
#
# Because we normalize currency in our database as a value in cents (USD),
# conversion from dollars to cents is often needed. It's not reasonable
# to expect users to input a value in cents from the UI. Including this module
# in a model that responds to #amount and #amount= will allow the model
# to also respond to #amount_in_dollars and #amount_in_dollars=
#
# N.B. this API makes the assumption that the #foo counterpart to #foo_in_dollars
# represents a value in cents.
module DollarConvertable
  def method_missing(method, arg = nil)
    root_method = method.to_s.gsub("_in_dollars", "").to_sym

    case method.to_s
    when /_in_dollars$/
      root_value = send(root_method)

      if root_value.nil?
        nil
      else
        root_value.to_f / 100
      end
    when /_in_dollars=$/
      if arg.nil?
        send(root_method, nil)
      else
        send(root_method, arg.to_f * 100)
      end
    when /_in_dollars/
      send(root_method)
    else
      super
    end
  end

  def respond_to_missing?(method, _include_private = false)
    case method.to_s
    when /in_dollars$/, /in_dollars=$/, /_in_dollars/
      true
    else
      super
    end
  end
end
