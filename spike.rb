require 'date'

datedate = (Date.today+5).strftime("%Y-%0m-%0e")
p datedate

val0 = 0
val1 = 1

p val0 && val1
p val0 || val1

def metodo (var=nil)
    p var
end
metodo(13)
metodo

h1 = {"user_id"=>"", "status"=>"3", "code"=>"0"}
h2 = {"user_id"=>"1", "status"=>"2"}
h1.merge!(h2)
p h1
