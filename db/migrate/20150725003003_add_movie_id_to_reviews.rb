class AddMovieIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :movie_id, :string, null: false
    add_index :reviews, :movie_id
  end
end
