require 'ffaker'

Actor.destroy_all

5.times do
  case gender = ["Male", "Female"].sample
    when "Female" then name = FFaker::Name.first_name_female
    when "Male" then name = FFaker::Name.first_name_male
  end

  actor = Actor.create({
    first_name: name,
    last_name: FFaker::Name.last_name,
    known_for: FFaker::Movie.title,
    age: rand(13..94),
    gender: gender
  })
end

Movie.destroy_all

movie = Movie.create({
  title: "The Great Gatsby",
  year: 2013,
  plot: "Midwest native Nick Carraway (Tobey Maguire) arrives in 1922 New York in search of the American dream. Nick, a would-be writer, moves in next-door to millionaire Jay Gatsby (Leonardo DiCaprio) and across the bay from his cousin Daisy (Carey Mulligan) and her philandering husband, Tom (Joel Edgerton). Thus, Nick becomes drawn into the captivating world of the wealthy and -- as he bears witness to their illusions and deceits -- pens a tale of impossible love, dreams, and tragedy."
})

movie = Movie.create({
  title: "Titanic",
  year: 1997,
  plot: "James Cameron's 'Titanic' is an epic, action-packed romance set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the 'ship of dreams' -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912."
})

movie = Movie.create({
  title: "Avatar",
  year: 2009,
  plot: "On the lush alien world of Pandora live the Na'vi, beings who appear primitive but are highly evolved. Because the planet's environment is poisonous, human/Na'vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully (Sam Worthington), a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na'vi woman (Zoe Saldana). As a bond with her grows, he is drawn into a battle for the survival of her world."
})