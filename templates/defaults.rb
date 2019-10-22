meta :defaults do
  accepts_list_for :write
  accepts_list_for :unwrite
  accepts_value_for :reverse

  def write_val
    reverse ? unwrite : write
  end

  def domain_key
    write_val[0]
  end

  def new_value
    [true, false].include?(write_val[1]) ? write_val[1].to_s.upcase : write_val[1]
  end

  def current_value
    [ %x[#{format("defaults read %s 2>/dev/null", domain_key)}].chomp
    ].compact
      .reject(&:empty?)
      .first
  end

  def eq?(a, b)
    a == b \
    || a.to_s == "TRUE" && b.to_s == "1" \
    || a.to_s == "FALSE" && b.to_s == "0" \
    || b.to_s == "TRUE" && a.to_s == "1" \
    || b.to_s == "FALSE" && a.to_s == "0" \
  end

  def write_defaults
    if reverse && new_value.nil?
      log_shell(
        "defaults delete #{domain_key}",
        "defaults delete #{domain_key}",
      )
    else
      log_shell(
        "defaults write #{domain_key} #{new_value}",
        "defaults write #{domain_key} #{new_value}",
      )
    end
  end

  template {
    met? { eq?(current_value, new_value) }
    meet { write_defaults }
  }
end
