module ApplicationHelper
  def error_class(entity, field)
    'has-error' if entity.errors.any? && entity.errors[field].any?
  end

  def error_msg(entity, field)
    if entity.errors.any?
      errors = entity.errors[field]
      content_tag(:span, errors.join(', '), class: 'help-block') if errors.any?
    end
  end
end
