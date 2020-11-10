# frase = "\"Gabriel\", \"gabriel@admin.com\", \"gabriel123\", 1, \"200000000\""
# values = frase.split(/,\s?/)
# values.each_with_index do |value, i|
#     if /"([^"]*)"/ === value
#         value.gsub!(/"/,'')
#     else
#         values[i] = value.to_i
#     end
# end
# columns = [:full_name, :email, :password, :role, :registration]
# record = Hash[columns.zip(values)]
# p record

# frase = "\"gabriel@admin.com\", \"gabriel123\""
# values = frase.gsub!(/["']/,'').split(/,\s?/)
# p values