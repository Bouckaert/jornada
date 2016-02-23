require 'test_helper'

class BookTest < ActiveSupport::TestCase
   test "Não salva livro sem titulo" do
     book = books(:livro_sem_titulo)
     assert_not book.save, "Livro salvo sem titulo"
   end

   test "Não salva livro com titulo menor que 5" do
   	book = books(:livro_titulo_menor_5)
   	assert_not book.save, "Livro salvo com titulo menor
   	 que cinco caracteres"
   end

end
