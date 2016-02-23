require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase

	def setup
	  @review = reviews(:neutro)
	  @book = @review.book	  
	end 

	def teardown
	  @review = nil
	end

	test "Cadastra review" do
  		assert_difference('Review.count') do
    		post :create, id: @review, book_id: @review.book_id,
    		 review: {rate: 3, comment: 'Vale a leitura'}
  		end
 
  		assert_redirected_to book_path(@book)
	end

end
