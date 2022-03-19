# frozen_string_literal: true

class MdcFormBuilder < ActionView::Helpers::FormBuilder
  # rubocop:disable Metrics/AbcSize
  def text_field(method, options = {})
    classes = Array(options[:class]).split + ['mdc-text-field__input']
    options[:class] = classes.compact.uniq.join(' ').strip

    # Fix for known Safari bug, https://github.com/material-components/material-components-web/issues/5879
    options[:placeholder] = options[:placeholder] || ' '

    @template.tag.label(class: 'mdc-text-field mdc-text-field--filled') do
      @template.concat(@template.tag.span(class: 'mdc-text-field__ripple'))
      @template.concat(@template.tag.span(class: 'mdc-floating-label', id: options[:id]) { 'URL' })
      @template.concat(super(method, options))
      @template.concat(@template.tag.span(class: 'mdc-line-ripple'))
    end
  end

  # rubocop:disable Metrics/MethodLength
  def button(value = nil, options = {}, &block)
    classes = options[:class].split + ['mdc-button', 'mdc-button--touch']
    options[:class] = classes.compact.uniq.join(' ')

    @template.tag.div(class: 'mdc-touch-target-wrapper') do
      @template.button_tag(nil, options) do
        @template.concat(@template.tag.span(class: 'mdc-button__ripple'))
        @template.concat(@template.tag.span(class: 'mdc-button__touch'))
        @template.concat(@template.content_tag(:span, class: 'mdc-button__label') do
          block ? block.call : value
        end)
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
