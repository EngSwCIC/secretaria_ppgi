# frozen_string_literal: true

require 'rails_helper'
require 'devise'

RSpec.describe 'home/index.html.erb', type: :view do
  let(:student) { FactoryGirl.create :user }

  context 'when user is signed in' do
    before do
      sign_in student
    end

    it 'should show users name, e-mail and role' do
      render
      assert_select 'p', text: "Nome: #{student.full_name}"
      assert_select 'p', text: "Email: #{student.email}"
      assert_select 'p', text: "Cargo: #{student.role}"
    end

    it 'should show Leave, Solicitations and Requirements  buttons' do
      render
      assert_select 'form[action=?][method=?]', '/users/sign_out', 'post' do
        assert_select 'input[type=submit][value=?]', 'Sair'
      end
      expect(rendered).to  have_button('Solicitações')
      expect(rendered).to  have_button('Requerimentos')

    end

    it 'does not show Enter button' do
      render
      assert_select 'form[action=?][method=?]', user_session_path, 'get', count: 0 do
        assert_select 'input[type=submit][value=?]', 'Enter', count: 0
      end
    end
  end

  context 'when user is not signed in' do
    it 'should show Enter button' do
      render
      assert_select 'form[action=?][method=?]', user_session_path, 'get' do
        assert_select 'input[type=submit][value=?]', 'Entrar'
      end
    end

    it 'does not show solicitations button' do
      render
      assert_select 'form[action=?][method=?]', solicitations_path, 'get', count: 0 do
        assert_select 'input[type=submit][value=?]', 'Solicitações', count: 0
      end
    end
  end
end
