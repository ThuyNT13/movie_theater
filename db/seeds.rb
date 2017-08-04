s1 = Screen.create(room_no:1, capacity:75)
s2 = Screen.create(room_no:2, capacity:150)
s3 = Screen.create(room_no:3, capacity:300)

m1 = Movie.create(screen_id:1, title: "La Jetée", context:"Told almost completely through photomontage and taking place in a post-apocalyptic Paris, it's a story about time-travel, memories that persist, and the inescapability of fate. If you have seen 12 Monkeys, some of the concepts and the storyline were inspired by La Jetée.", showtime: "2017-08-09 20:30:00")

m2 = Movie.create(screen_id:2, title: "Tampopo", context:"It's a noodle western! The story is about a widow who enlists a trucker to help make her ramen restaurant achieve gustatory excellence. But the main character is food and how it's consumed in all its glories.", showtime: "2017-08-09 4:15:00")

m3 = Movie.create(screen_id:3, title: "Mad Monster Party", context:"Originally marketed to kids, the adult-themed jokes and Francesca's hyper-sexualized feminine qualities were a little off-putting for parents who expected Frosty the Snowman virtues. Now it has gained cult status for its surreal grooviness.", showtime: "2017-08-09 11:00:00")
