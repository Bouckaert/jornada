require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
   test "Não salva review fora do range" do
     review = reviews(:harry_fan)
     assert_not review.save, "Review com rate 10 salva"
   end
   
   test "Valida associação declarada na fixture" do
     book = reviews(:harry_fan).book
     assert_equal book,books(:teen)
   end

end
