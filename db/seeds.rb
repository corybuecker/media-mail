# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Link.destroy_all

links = [
  'https://corybuecker.com',
  'https://corybuecker.com/post/aggregating-blog-analytics-with-exlytics'
]

links.each do |url|
  Link.create(url:).tap(&:create_page!)
end
