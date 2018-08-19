require "spec_helper"

feature "user views list of TV shows" do
  # As a TV fanatic
  # I want to view a list of TV shows
  # So I can find new shows to watch
  #
  # Acceptance Criteria:
  # * I can see the names and networks of all TV shows

  scenario "view list of TV shows" do
    # First create some sample TV shows
    game_of_thrones = TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO",
        starting_year: 2011, genre: "Fantasy"
      })

    married_with_children = TelevisionShow.create!({
        title: "Married... with Children", network: "Fox",
        starting_year: 1987, ending_year: 1997,
        genre: "Comedy"
      })

    # The user visits the index page
    visit "/television_shows"

    # And should see both TV shows listed (just the title and network)
    expect(page).to have_content("Game of Thrones (HBO)")
    expect(page).to have_content("Married... with Children (Fox)")
  end

  # As a TV fanatic
  # I want to view the details for a TV show
  # So I can find learn more about it
  scenario "view details for a TV show" do
  # first, create some sample TV shows

  visit "/television_shows/new"
  fill_in "title", with: "Firefly"
  fill_in "network", with: "Fox"
  fill_in "starting_year", with: "2002"
  fill_in "ending_year", with: "2002"
  fill_in "synopsis", with: "You can't take the sky from me."
  click_button "Add TV Show"
  click_link('Firefly (Fox)')
    # Acceptance Criteria:
    # * I can see the title, network, start and end year, genre, and synopsis
    #   for a show.
  expect(page).to have_content("Firefly")
  expect(page).to have_content("Fox")
  expect(page).to have_content("2002 - 2002")
  expect(page).to have_content("You can't take the sky from me.")
    # * If the end year is not provided it should indicate that the show is still
    #   running.



  end

  pending "view details for a TV show with missing information"
end
