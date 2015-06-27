module StarRatingFilter

	# Location of the star images from root of website
	Star_imagesLoc = "/assets/img"

	# The format of the img tag used by % method
	Star_imageTag = "<img src=\"#{Star_imagesLoc}/%s\" alt=\"%s\" height=\"16\" width=\"16\" />"

	Open_divTag = "<div class=\"starplugin\">"

	Close_divTag= "</div>"

	# Displays the rating as a series of stars
	def star_rating(rating)

		wholeStars = rating.floor
		wholeStars += 1 if (rating - wholeStars > 0.5)
		halfStar = (rating - wholeStars == 0.5 ? 1 : 0)
		clearStars = 5 - (wholeStars + halfStar)
		ratingAltText = "%.1f/5.0" % [rating]

		htmlOutput = ""
		wholeStars.times do
			htmlOutput += Open_divTag
			htmlOutput += Star_imageTag % ["star_filled.png", "#{ratingAltText}"]
			ratingAltText = ""
			htmlOutput += Close_divTag
		end

		if (halfStar == 1)
			htmlOutput += Open_divTag
			htmlOutput += Star_imageTag % ["star_half.png", "#{ratingAltText}"]
			ratingAltText = ""
			htmlOutput += Close_divTag
		end

		clearStars.times do
			htmlOutput += Open_divTag
			htmlOutput += Star_imageTag % ["star_clear.png", "#{ratingAltText}"]
			ratingAltText = ""
			htmlOutput += Close_divTag
		end
		return htmlOutput
	end

end

Liquid::Template.register_filter(StarRatingFilter)
