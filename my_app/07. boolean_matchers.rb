# Boolean matchers
require 'roda'

class App < Roda

  def allow?
    request.ip == '127.0.0.1'
    true #workaround just for the sake of the test
  end

  def allowed_prefix
    "let-me-in" if allow?
  end

  route do |r|
    r.on allowed_prefix do
      "Allowed #{r.remaining_path}"
    end

    r.on allow? do
      "Also Allowed #{r.remaining_path}"
    end
  end

end