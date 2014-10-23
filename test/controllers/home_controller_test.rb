# coding: utf-8
require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test 'routing' do
    assert_routing root_path, controller: 'home', action: 'welcome'
    assert_routing about_path, controller: 'home', action: 'about'
    assert_routing meetings_path, controller: 'home', action: 'meetings'
  end

  test 'the welcome page' do
    get :welcome
    assert_response :success
    assert_select 'title', 'Scottish Linux User Group — Welcome'
    assert_select 'h1.page-header', 'Welcome'
    assert_select %(li.active>a[href="#{root_path}"]), 'Welcome'
  end

  test 'the about page' do
    get :about
    assert_response :success
    assert_select 'title', 'Scottish Linux User Group — About'
    assert_select 'h1.page-header', 'About'
    assert_select %(li.active>a[href="#{about_path}"]), 'About'
  end

  test 'the meetings page' do
    get :meetings
    assert_response :success
    assert_select 'title', 'Scottish Linux User Group — Meetings'
    assert_select 'h1.page-header', 'Meetings'
    assert_select %(li.active>a[href="#{meetings_path}"]), 'Meetings'
  end
end