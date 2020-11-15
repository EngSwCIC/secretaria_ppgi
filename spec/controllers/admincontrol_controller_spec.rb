require 'rails_helper'

=begin
describe AdminControlController do
  describe 'adding new source of information in the database' do
    it 'calls the model method that allow to register a new source of information'
    it 'fill the form with information about the new source'
    it 'shows that the source was succesfully added'
  end
  describe 'adding source of information that already exists in the database' do
    it 'calls the model method that allow to register a new source of information'
    it 'fill the form with information about the new source'
    it 'shows that the source could not be added because it already exists on the list'
  end
end  
=end

describe SourcesController do
  describe "#create" do
    context 'with correct params' do
      it {is_expected.to respond_with 201}
    end
    
    context 'with missing params' do
      it {is_expected.to respond_with 400}
    end

    context 'already exists' do
      it {is_expected.to respond_with 403}
  end      
end  
end