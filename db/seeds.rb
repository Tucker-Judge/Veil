# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
luke = User.create(name: "Luke", lang_code: "en-US", password: "123", username: "mvp", email: "mvp@example.com")
#email must be a valid email address
germanlang = Language.create(language: "German")
frenchlang = Language.create(language: "French")
englishlang = Language.create(language: "English")

germanwords = Lesson.create(user_id: luke.id, language_id: germanlang.id, title: "German Freaq")
englishwords = Lesson.create(user_id: luke.id, language_id: englishlang.id, title: "English Freaq")
frenchwords = Lesson.create(user_id: luke.id, language_id: frenchlang.id, title: "French Freaq")

# Seed data for 50 most common words in German

# Create German language record


# Create flashcards

Flashcard.create(front: "der", back: {"en-US": "the", "fr-FR": "le/la"})
Flashcard.create(front: "und", back: {"en-US": "and", "fr-FR": "et"})
Flashcard.create(front: "sein", back: {"en-US": "to be", "fr-FR": "être"})
Flashcard.create(front: "in", back: {"en-US": "in", "fr-FR": "dans"})
Flashcard.create(front: "ein", back: {"en-US": "a/an", "fr-FR": "un/une"})
Flashcard.create(front: "zu", back: {"en-US": "to", "fr-FR": "à"})
Flashcard.create(front: "ich", back: {"en-US": "I", "fr-FR": "je"})
Flashcard.create(front: "haben", back: {"en-US": "to have", "fr-FR": "avoir"})
Flashcard.create(front: "werden", back: {"en-US": "to become/will", "fr-FR": "devenir/va"})
Flashcard.create(front: "von", back: {"en-US": "of/from", "fr-FR": "de-DE"})
Flashcard.create(front: "nicht", back: {"en-US": "not", "fr-FR": "ne pas"})
Flashcard.create(front: "mit", back: {"en-US": "with", "fr-FR": "avec"})
Flashcard.create(front: "sich", back: {"en-US": "oneself", "fr-FR": "soi-même"})
Flashcard.create(front: "an", back: {"en-US": "at/on", "fr-FR": "à/sur"})
Flashcard.create(front: "für", back: {"en-US": "for", "fr-FR": "pour"})
Flashcard.create(front: "so", back: {"en-US": "so", "fr-FR": "ainsi"})
Flashcard.create(front: "wie", back: {"en-US": "how/like", "fr-FR": "comment/comme"})
Flashcard.create(front: "dass", back: {"en-US": "that", "fr-FR": "que"})
Flashcard.create(front: "was", back: {"en-US": "what", "fr-FR": "quoi"})
Flashcard.create(front: "wenn", back: {"en-US": "if/when", "fr-FR": "si/quand"})
Flashcard.create(front: "yes", back: {"en-US": "ja", "fr-FR": "oui"})
Flashcard.create(front: "nein", back: {"en-US": "no", "fr-FR": "non"})
Flashcard.create(front: "aber", back: {"en-US": "but", "fr-FR": "mais"})
Flashcard.create(front: "oder", back: {"en-US": "or", "fr-FR": "ou"})
Flashcard.create(front: "aus", back: {"en-US": "out of/from", "fr-FR": "de/hors"})
Flashcard.create(front: "mehr", back: {"en-US": "more", "fr-FR": "plus"})
Flashcard.create(front: "dann", back: {"en-US": "then", "fr-FR": "ensuite"})
Flashcard.create(front: "nur", back: {"en-US": "only", "fr-FR": "seulement"})
Flashcard.create(front: "der", back: {"en-US": "the", "fr-FR": "le/la"})
Flashcard.create(front: "und", back: {"en-US": "and", "fr-FR": "et"})
Flashcard.create(front: "in", back: {"en-US": "in", "fr-FR": "dans"})
Flashcard.create(front: "zu", back: {"en-US": "to", "fr-FR": "à"})
Flashcard.create(front: "ein", back: {"en-US": "a, an", "fr-FR": "un/une"})
Flashcard.create(front: "ich", back: {"en-US": "I", "fr-FR": "je"})
Flashcard.create(front: "sie", back: {"en-US": "she, they", "fr-FR": "elle(s)"})
Flashcard.create(front: "nicht", back: {"en-US": "not", "fr-FR": "ne pas"})
Flashcard.create(front: "die", back: {"en-US": "the", "fr-FR": "le/la"})
Flashcard.create(front: "ist", back: {"en-US": "is", "fr-FR": "est"})
Flashcard.create(front: "es", back: {"en-US": "it", "fr-FR": "il/elle"})
Flashcard.create(front: "was", back: {"en-US": "what", "fr-FR": "quoi"})
Flashcard.create(front: "wir", back: {"en-US": "we", "fr-FR": "nous"})
Flashcard.create(front: "zu", back: {"en-US": "to, too", "fr-FR": "trop"})
Flashcard.create(front: "meine", back: {"en-US": "my", "fr-FR": "mon/ma/mes"})
Flashcard.create(front: "dir", back: {"en-US": "you (singular)", "fr-FR": "tu"})
Flashcard.create(front: "dass", back: {"en-US": "that", "fr-FR": "que"})
Flashcard.create(front: "mit", back: {"en-US": "with", "fr-FR": "avec"})
Flashcard.create(front: "aber", back: {"en-US": "but", "fr-FR": "mais"})
Flashcard.create(front: "seine", back: {"en-US": "his", "fr-FR": "son/sa/ses"})
Flashcard.create(front: "sich", back: {"en-US": "oneself, each other", "fr-FR": "soi-même/l'un l'autre"})
Flashcard.create(front: "von", back: {"en-US": "from, of", "fr-FR": "de"})
Flashcard.create(front: "du", back: {"en-US": "you (singular)", "fr-FR": "tu"})
Flashcard.create(front: "im", back: {"en-US": "in the", "fr-FR": "dans le/la"})
Flashcard.create(front: "mich", back: {"en-US": "me", "fr-FR": "moi"})
Flashcard.create(front: "wenn", back: {"en-US": "when", "fr-FR": "quand"})
Flashcard.create(front: "man", back: {"en-US": "one, people, you (impersonal)", "fr-FR": "on"})
Flashcard.create(front: "so", back: {"en-US": "so", "fr-FR": "ainsi"})
Flashcard.create(front: "nicht", back: {"en-US": "not", "fr-FR": "ne pas"})
Flashcard.create(front: "sie", back: {"en-US": "she/they", "fr-FR": "elle/elles"})
Flashcard.create(front: "sein", back: {"en-US": "to be (his)", "fr-FR": "être (son)"})
Flashcard.create(front: "aber", back: {"en-US": "but", "fr-FR": "mais"})
Flashcard.create(front: "ein", back: {"en-US": "a/an", "fr-FR": "un/une"})
Flashcard.create(front: "mein", back: {"en-US": "my", "fr-FR": "mon/ma"})
Flashcard.create(front: "auch", back: {"en-US": "also/too", "fr-FR": "aussi"})
Flashcard.create(front: "dass", back: {"en-US": "that", "fr-FR": "que"})
Flashcard.create(front: "wenn", back: {"en-US": "when", "fr-FR": "quand"})
Flashcard.create(front: "weg", back: {"en-US": "way", "fr-FR": "chemin"})
Flashcard.create(front: "sein", back: {"en-US": "his", "fr-FR": "son"})
Flashcard.create(front: "sagen", back: {"en-US": "to say", "fr-FR": "dire"})
Flashcard.create(front: "machen", back: {"en-US": "to make/do", "fr-FR": "faire"})
Flashcard.create(front: "dies", back: {"en-US": "this", "fr-FR": "ceci/cette"})
Flashcard.create(front: "werden", back: {"en-US": "to become", "fr-FR": "devenir"})
Flashcard.create(front: "können", back: {"en-US": "can", "fr-FR": "pouvoir"})
Flashcard.create(front: "ja", back: {"en-US": "yes", "fr-FR": "oui"})
Flashcard.create(front: "jahr", back: {"en-US": "year", "fr-FR": "année"})
Flashcard.create(front: "immer", back: {"en-US": "always", "fr-FR": "toujours"})
Flashcard.create(front: "zurück", back: {"en-US": "back", "fr-FR": "en arrière"})
Flashcard.create(front: "nehmen", back: {"en-US": "to take", "fr-FR": "prendre"})
Flashcard.create(front: "geben", back: {"en-US": "to give", "fr-FR": "donner"})
Flashcard.create(front: "sehen", back: {"en-US": "to see", "fr-FR": "voir"})
Flashcard.create(front: "lassen", back: {"en-US": "to let/allow", "fr-FR": "laisser"})
Flashcard.create(front: "erst", back: {"en-US": "only", "fr-FR": "seulement"})
Flashcard.create(front: "dann", back: {"en-US": "then", "fr-FR": "alors"})
Flashcard.create(front: "gut", back: {"en-US": "good", "fr-FR": "bon(ne)"})
Flashcard.create(front: "geben", back: {"en-US": "to give", "fr-FR": "donner"})
Flashcard.create(front: "nein", back: {"en-US": "no", "fr-FR": "non"})
Flashcard.create(front: "wissen", back: {"en-US": "to know", "fr-FR": "savoir"})
Flashcard.create(front: "leben", back: {"en-US": "to live", "fr-FR": "vivre"})
Flashcard.create(front: "viel", back: {"en-US": "much/many", "fr-FR": "beaucoup"})
Flashcard.create(front: "sehr", back: {"en-US": "very", "fr-FR": "très"})
Flashcard.create(front: "einfach", back: {"en-US": "easy/simple", "fr-FR": "facile"})


french_words = ["le", "de", "un", "à", "être", "et", "en", "avoir", "que", "pour", "dans", "ce", "qui", "il", "sur", "pas", "au", "plus", "se", "ne"]
german_words = ["der", "die", "und", "in", "den", "von", "zu", "das", "mit", "sich", "des", "auf", "für", "ist", "im", "dem", "nicht", "ein", "eine", "als"]
english_words = ["the", "of", "a/an", "to", "be", "and", "in", "have", "that", "for", "on", "this", "with", "not", "by", "or", "as", "from", "at", "which"]

(1..20).each do |i|
  Flashcard.create(id: i+90, front: french_words[i-1], back: {"en-US": english_words[i-1], "de-DE": german_words[i-1]})
end
(1..20).each do |i|
  Flashcard.create(id: i+110, front: english_words[i-1], back: {"en-FR": french_words[i-1], "de-DE": german_words[i-1]})
end
(1..90).each do |i|
    LanguageFlashcard.create(language_id: germanlang.id, flashcard_id: i, title: "German Freaq")
  end
(91..110).each do |i|
    LanguageFlashcard.create(id: i, language_id: frenchlang.id, flashcard_id: i, title: "French Freaq")
  end
(111..130).each do |i|
    LanguageFlashcard.create(id: i, language_id: englishlang.id, flashcard_id: i, title: "English Freaq")
  end



# add short stories 
# add lang_code of front
# noun adj verb adj 


# short story example
Flashcard.create(cover_info: "Lorem ipsum dolor sit amet, consectetur adip", front: "Lorem ipsum dolor sit amet, consectetur adip"
,back: {"en-Us": ["noun,adjective,verb"], "fr-FR": ["nom,adjectif,action"]})
# one word a set
# try to add options
# add options through frontend but not in backend
# front would be the word
# back would be the answer in your language

# one type a set?
# contain everything in the back