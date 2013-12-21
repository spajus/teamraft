require 'digest/md5'
module ApplicationHelper

  def icon(name, title)
    content_tag(:i, '', class: "fa fa-#{name || 'circle'}", title: title)
  end

  def photo_url(person, options = {})
    return person.photo if person.photo
    hash = Digest::MD5.hexdigest(person.email)
    "http://www.gravatar.com/avatar/#{hash}?s=#{options[:size] || 200}"
  end

  def admin_tag(person)
    icon('asterisk', 'Administrator') if person.admin?
  end

  def error_class(entity, field)
    'has-error' if entity && entity.errors.any? && entity.errors[field].any?
  end

  def error_msg(entity, field)
    if entity && entity.errors.any?
      errors = entity.errors[field]
      content_tag(:span, errors.join(', '), class: 'help-block') if errors.any?
    end
  end
end
