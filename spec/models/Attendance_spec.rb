require 'rails_helper'
	RSpec.describe Attendance , type: :model do
		context 'validation tests' do
			it 'ensures title presence' do
				at = Attendance.new(content: 'casa legal').save
				expect(at).to eq(false) 
			end
		

			it 'ensures content presence' do
				at = Attendance.new(title:'filme').save
				expect(at).to eq(false) 
			end
			it 'should save successfully' do
				at = Attendance.new(title:'duro de matar' , content:'acao' ).save
				expect(at).to eq(true) 
			end

			  it "have name?" do # sim, você pode user 'it' (lê-se como 'isso tem um nome')
   				 at = Attendance.new(title: "MIB") # criando uma nova titulo
   				 expect(at.title).to eq("Os vingadores") # 
			end
		end
	end