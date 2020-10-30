require 'rails_helper'

describe InformationController do
  describe 'add new info' do
    it 'renders the New Information template'
    it 'fills the template with new information data and sends it to the server'
    it 'calls the controller method that performs information content validation'
    it 'adds the information to the database'
  end
  describe 'add info that has already been added' do
    it 'renders the New Information template'
    it 'fills the template with new information data and sends it to the server'
    it 'calls the controller method that performs information content validation'
    it 'renders the New Information template with an error message'
  end
end