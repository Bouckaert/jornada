require 'test_helper'

class BooksControllerTest < ActionController::TestCase

	def setup
	  @book = books(:teen)
	end 

	def teardown
	  @book = nil
	end

	test "Cadastra livro" do
  		assert_difference('Book.count') do
    		post :create, book: {title: 'Some title'}
  		end
 
  		assert_redirected_to book_path(assigns(:book))
	end

	test "Lista livros" do
	    get :index
	    assert_response :success
	    assert_not_nil assigns(:books)
	end

	test "Visualiza livro" do
	    get :show, id: @book.id
	    assert_response :success
	end

	test "Edita livro" do
		get :edit, id: @book.id
	    assert_response :success
	end

	test "Atualiza livro editado" do
		@book.title = 'new one'
	    patch :update, id: @book, book: {title: @book.title}
	    assert_redirected_to book_path(assigns(:book))
	    assert_equal 'new one', @book.title
 	end

	test "Deleta livro" do
		assert_difference('Book.count', -1) do
	    	delete :destroy, id: @book.id
	  	end
    	assert_redirected_to books_path
	end

	test "Visualiza a review" do
		get :show, id: @book
		assert_template 'books/show'

		@book.reviews.each do |r|
			assert_select 'label' do |element|
				element.children.each do |key|
				end
			end
		end
	end

end
