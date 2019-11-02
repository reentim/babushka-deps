meta :cron do
  accepts_value_for :at
  accepts_value_for :run

  def reverse?
    dependency.args[:reversed?]&.current_value
  end

  def append_crontab
    %x[(crontab -l; echo "#{at} #{run}") | sort - | uniq - | crontab -]
    log "Adding to crontab:"
    log "  #{at} #{run}"
  end

  def remove_crontab
    %x{(crontab -l | grep -v --fixed-strings "#{at} #{run}") | sort - | uniq - | crontab -}
    log "Removing from crontab:"
    log "  #{at} #{run}"
  end

  def cron_present?
    %x[crontab -l].lines.any? {|l| l.chomp == "#{at} #{run}" }
  end

  template {
    met? { reverse? ? !cron_present? : cron_present? }
    meet { reverse? ? remove_crontab : append_crontab
    }
  }
end
