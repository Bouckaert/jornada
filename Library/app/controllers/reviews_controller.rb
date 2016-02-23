class ReviewsController < ApplicationController
	def create
	    @book = Book.find(params[:book_id])
	    @review = @book.reviews.create(review_params)


      	@review.save
      	redirect_to book_path(@book)
  end

  private
    def review_params
      params.require(:review).permit(:rate, :comment)
    end
end
