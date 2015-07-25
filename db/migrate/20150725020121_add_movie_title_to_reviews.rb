class AddMovieTitleToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :movie_title, :string, null: false
  end
end
