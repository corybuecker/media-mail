# frozen_string_literal: true

require 'test_helper'

class MaterialFormBuilderTest < ActionView::TestCase
  include Rails::Dom::Testing::Assertions::SelectorAssertions

  def test_single_button
    @html = helper.button('test')
    assert_select 'button', 1
  end

  def test_ripple_in_button
    @html = helper.button('test')
    assert_select 'button' do
      assert_select 'span.mdc-button__ripple', 1
    end
  end

  def test_string_in_button
    @html = helper.button('test string')
    assert_select 'button' do
      assert_select 'span.mdc-button__label', 'test string'
    end
  end

  def test_classes_on_button
    @html = helper.button('test string', class: 'extra-class')
    assert_select 'button.extra-class', 1
  end

  def test_mdc_classes_on_button
    @html = helper.button('test string', class: 'extra-class')
    assert_select 'button.extra-class.mdc-button', 1
  end

  def test_button_block
    @html = helper.button('test string') do
      'block content'
    end

    assert_select 'button' do
      assert_select 'span.mdc-button__label', 'block content'
    end
  end

  def test_single_input
    @html = helper.text_field('test')
    assert_select 'input', 1
  end

  def test_ripple_in_input
    @html = helper.text_field('test')
    assert_select 'label' do
      assert_select 'span.mdc-text-field__ripple', 1
    end
  end

  def test_string_in_input
    @html = helper.text_field('test string')
    assert_select 'label' do
      assert_select 'span.mdc-floating-label', 'Test String'
    end
  end

  def test_classes_on_input
    @html = helper.text_field('test string', class: 'extra-class')
    assert_select 'label.extra-class', 1
  end

  def test_mdc_classes_on_input
    @html = helper.text_field('test string', class: 'extra-class')
    assert_select 'label.extra-class.mdc-text-field', 1
  end

  private

  def helper
    MaterialFormBuilder.new(nil, nil, ActionView::Base.new(nil, {}, nil), {})
  end

  def document_root_element
    Nokogiri::HTML::Document.parse(@html).root
  end
end
