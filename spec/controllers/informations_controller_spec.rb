require 'rails_helper'

describe InformationsController do
  describe 'viewing available information' do
    it 'calls the model method that performs information list'
    it 'selects the List Results template for rendering'
    it 'makes the information list results available to that template'
  end
  describe 'viewing unavailable information' do
    it 'calls the model method that performs information list'
    it 'selects the List Results template for rendering'
    it 'returns an empty information list results to that template'
  end
end