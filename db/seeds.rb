Deck.create!  id: 66, name: "Jake's sick deck"

Card.create!  term: 'jake', definition: 'who is the coolest?', deck_id: 66
Card.create!  term: 'jake', definition: 'who is the smartest?', deck_id: 66
Card.create!  term: 'jake', definition: 'who is the has a great fashion sense?', deck_id: 66
Card.create!  term: 'jake', definition: 'who is the worst at spelling?', deck_id: 66
Card.create!  term: 'jake', definition: 'who do you love?', deck_id: 66

Deck.create(id: 7, name: "The Answer Is Always Blue")
Card.create(term: 'Blue', defintion: 'Which color starts with B and rhymes with glue?', deck_id: 7)
Card.create(term: 'Blue', definition: 'What is always the answer?', deck_id: 7)
Card.create(term: 'Blue', definition: 'Which color compliments orange?', deck_id: 7)
Card.create(term: 'Blue', definition: 'What color is the sky?', deck_id: 7)