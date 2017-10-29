describe 'an array' do
   def build_array(*args)
       puts "------"
       puts self
       puts "------"
       [*args]
   end

   puts "======="
   puts self
   puts "======="
   puts self.class
   puts "++++++++++++"
   puts self.class.object_id
   puts "++++++++++++"

   it 'has a length' do
      puts self.object_id
      raise unless build_array("a").length == 1
   end

   it 'has a first element' do
      raise unless build_array("a").first == "a" 
   end

end

