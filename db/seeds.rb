

tucker = User.new
tucker.email = "tucker.judge@yahoo.com"
tucker.password = "123456"
tucker.password_confirmation = "123456"
tucker.lang_code = "en-US"
tucker.is_admin = true
tucker.save!
luke = User.new
luke.email = "test@example.com"
luke.password = "123456"
luke.password_confirmation = "123456"
luke.lang_code = "fr-FR"
luke.save!
#email must be a valid email address

# Seed languages
germanlang = Language.create(language: "German")
englishlang = Language.create(language: "English")
frenchlang = Language.create(language: "French")

# Set language translations
# I18n.with_locale(:en) { germanlang.language = "German" }
I18n.with_locale(:fr) { germanlang.language = "Allemand" }
I18n.with_locale(:de) { germanlang.language = "Deutsch" }
# germanlang.save!

# I18n.with_locale(:en) { frenchlang.language = "French" }
I18n.with_locale(:de) { frenchlang.language = "Französisch" }
I18n.with_locale(:fr) { frenchlang.language = "Français" }

# frenchlang.save!

I18n.with_locale(:fr) { englishlang.language = "Anglais" }
I18n.with_locale(:de) { englishlang.language = "Englisch" }
# englishlang.save!


germanwords = Userlang.create(user_id: luke.id, language_id: germanlang.id)
englishwords = Userlang.create(user_id: luke.id, language_id: englishlang.id)
frenchwords = Userlang.create(user_id: luke.id, language_id: frenchlang.id)

# # Seed data for 50 most common words in German

# # Create German language record


# # Create flashcardscard_
frequency =FlashcardSet.create(language_id: germanlang.id, card_type: "Common Words", title: "First 10")
# Mobility.with_locale(:en) do
#   frequency.title = "First 10"
#   frequency.card_type = "Common Words"
# end
Mobility.with_locale(:fr) do
  frequency.title = "Premier 10"
  frequency.card_type = "Mots communs"
end
# frequency.save!

# Repeat for each flashcard
flashcard = Flashcard.new(flashcard_set_id: frequency.id, front: "und")
Mobility.with_locale(:en) { flashcard.back = "and" }
Mobility.with_locale(:fr) { flashcard.back = "et" }
flashcard.save

flashcard = Flashcard.new(flashcard_set_id: frequency.id, front: "sein")
Mobility.with_locale(:en) { flashcard.back = "to be" }
Mobility.with_locale(:fr) { flashcard.back = "être" }
flashcard.save

# Greetings Set 1: Basic Greetings
greetings1 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Greetings", title: "Basic Greetings")
Mobility.with_locale(:en) { greetings1.card_type = "Greetings" }
Mobility.with_locale(:de) { greetings1.card_type = "Begrüßungen" }
greetings1.save!

# Greetings Set 2: Informal Greetings
greetings2 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Greetings", title: "Informal Greetings")
Mobility.with_locale(:en) { greetings2.card_type = "Greetings" }
Mobility.with_locale(:de) { greetings2.card_type = "Begrüßungen" }
greetings2.save!

# Greetings Set 3: Formal Greetings
greetings3 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Greetings", title: "Formal Greetings")
Mobility.with_locale(:en) { greetings3.card_type = "Greetings" }
Mobility.with_locale(:de) { greetings3.card_type = "Begrüßungen" }
greetings3.save!

# Common Words Set 1: Basic Verbs
common_words1 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Common Words", title: "Basic Verbs")
Mobility.with_locale(:en) { common_words1.card_type = "Common Words" }
Mobility.with_locale(:de) { common_words1.card_type = "Häufige Wörter" }
common_words1.save!

# Common Words Set 2: Basic Nouns
common_words2 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Common Words", title: "Basic Nouns")
Mobility.with_locale(:en) { common_words2.card_type = "Common Words" }
Mobility.with_locale(:de) { common_words2.card_type = "Häufige Wörter" }
common_words2.save!

# Common Words Set 3: Basic Adjectives
common_words3 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Common Words", title: "Basic Adjectives")
Mobility.with_locale(:en) { common_words3.card_type = "Common Words" }
Mobility.with_locale(:de) { common_words3.card_type = "Häufige Wörter" }
common_words3.save!

# Adjectives Set 1: Colors
adjectives1 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Adjectives", title: "Colors")
Mobility.with_locale(:en) { adjectives1.card_type = "Adjectives" }
Mobility.with_locale(:de) { adjectives1.card_type = "Adjektive" }
adjectives1.save!

# Adjectives Set 2: Sizes
adjectives2 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Adjectives", title: "Sizes")
Mobility.with_locale(:en) { adjectives2.card_type = "Adjectives" }
Mobility.with_locale(:de) { adjectives2.card_type = "Adjektive" }
adjectives2.save!



# Greetings Set 1: Basic Greetings
greetings_flashcard1 = Flashcard.new(flashcard_set_id: greetings1.id, front: "Bonjour")
Mobility.with_locale(:en) { greetings_flashcard1.back = "Hello" }
Mobility.with_locale(:de) { greetings_flashcard1.back = "Hallo" }
greetings_flashcard1.save

greetings_flashcard2 = Flashcard.new(flashcard_set_id: greetings1.id, front: "Au revoir")
Mobility.with_locale(:en) { greetings_flashcard2.back = "Goodbye" }
Mobility.with_locale(:de) { greetings_flashcard2.back = "Auf Wiedersehen" }
greetings_flashcard2.save

# Greetings Set 2: Informal Greetings
greetings_flashcard3 = Flashcard.new(flashcard_set_id: greetings2.id, front: "Salut")
Mobility.with_locale(:en) { greetings_flashcard3.back = "Hi" }
Mobility.with_locale(:de) { greetings_flashcard3.back = "Hi" }
greetings_flashcard3.save

greetings_flashcard4 = Flashcard.new(flashcard_set_id: greetings2.id, front: "Ça va?")
Mobility.with_locale(:en) { greetings_flashcard4.back = "How are you?" }
Mobility.with_locale(:de) { greetings_flashcard4.back = "Wie geht's?" }
greetings_flashcard4.save

# Greetings Set 3: Formal Greetings
greetings_flashcard5 = Flashcard.new(flashcard_set_id: greetings3.id, front: "Madame")
Mobility.with_locale(:en) { greetings_flashcard5.back = "Madam" }
Mobility.with_locale(:de) { greetings_flashcard5.back = "Frau" }
greetings_flashcard5.save

greetings_flashcard6 = Flashcard.new(flashcard_set_id: greetings3.id, front: "Monsieur")
Mobility.with_locale(:en) { greetings_flashcard6.back = "Sir" }
Mobility.with_locale(:de) { greetings_flashcard6.back = "Herr" }
greetings_flashcard6.save




# Common Words Set 1: Basic Verbs
common_words1 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Common Words", title: "Basic Verbs")
Mobility.with_locale(:en) { common_words1.card_type = "Common Words" }
Mobility.with_locale(:de) { common_words1.card_type = "Häufige Wörter" }
common_words1.save!

common_words_flashcard1 = Flashcard.new(flashcard_set_id: common_words1.id, front: "être")
Mobility.with_locale(:en) { common_words_flashcard1.back = "to be" }
Mobility.with_locale(:de) { common_words_flashcard1.back = "sein" }
common_words_flashcard1.save

common_words_flashcard2 = Flashcard.new(flashcard_set_id: common_words1.id, front: "avoir")
Mobility.with_locale(:en) { common_words_flashcard2.back = "to have" }
Mobility.with_locale(:de) { common_words_flashcard2.back = "haben" }
common_words_flashcard2.save

# Common Words Set 2: Basic Nouns
common_words2 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Common Words", title: "Basic Nouns")
Mobility.with_locale(:en) { common_words2.card_type = "Common Words" }
Mobility.with_locale(:de) { common_words2.card_type = "Häufige Wörter" }
common_words2.save!

common_words_flashcard3 = Flashcard.new(flashcard_set_id: common_words2.id, front: "maison")
Mobility.with_locale(:en) { common_words_flashcard3.back = "house" }
Mobility.with_locale(:de) { common_words_flashcard3.back = "Haus" }
common_words_flashcard3.save

common_words_flashcard4 = Flashcard.new(flashcard_set_id: common_words2.id, front: "chien")
Mobility.with_locale(:en) { common_words_flashcard4.back = "dog" }
Mobility.with_locale(:de) { common_words_flashcard4.back = "Hund" }
common_words_flashcard4.save

# Common Words Set 3: Basic Prepositions
common_words3 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Common Words", title: "Basic Prepositions")
Mobility.with_locale(:en) { common_words3.card_type = "Common Words" }
Mobility.with_locale(:de) { common_words3.card_type = "Häufige Wörter" }
common_words3.save!

common_words_flashcard5 = Flashcard.new(flashcard_set_id: common_words3.id, front: "dans")
Mobility.with_locale(:en) { common_words_flashcard5.back = "in" }
Mobility.with_locale(:de) { common_words_flashcard5.back = "in" }
common_words_flashcard5.save

common_words_flashcard6 = Flashcard.new(flashcard_set_id: common_words3.id, front: "sur")
Mobility.with_locale(:en) { common_words_flashcard6.back = "on" }
Mobility.with_locale(:de) { common_words_flashcard6.back = "auf" }
common_words_flashcard6.save

# Adjectives Set 1: Colors
adjectives1 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Adjectives", title: "Colors")
Mobility.with_locale(:en) { adjectives1.card_type = "Adjectives" }
Mobility.with_locale(:de) { adjectives1.card_type = "Adjektive" }
adjectives1.save!

adjectives_flashcard1 = Flashcard.new(flashcard_set_id: adjectives1.id, front: "rouge")
Mobility.with_locale(:en) { adjectives_flashcard1.back = "red" }
Mobility.with_locale(:de) { adjectives_flashcard1.back = "rot" }
adjectives_flashcard1.save

adjectives_flashcard2 = Flashcard.new(flashcard_set_id: adjectives1.id, front: "bleu")
Mobility.with_locale(:en) { adjectives_flashcard2.back = "blue" }
Mobility.with_locale(:de) { adjectives_flashcard2.back = "blau" }
adjectives_flashcard2.save

# Adjectives Set 2: Sizes
adjectives2 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Adjectives", title: "Sizes")
Mobility.with_locale(:en) { adjectives2.card_type = "Adjectives" }
Mobility.with_locale(:de) { adjectives2.card_type = "Adjektive" }
adjectives2.save!

adjectives_flashcard3 = Flashcard.new(flashcard_set_id: adjectives2.id, front: "petit")
Mobility.with_locale(:en) { adjectives_flashcard3.back = "small" }
Mobility.with_locale(:de) { adjectives_flashcard3.back = "klein" }
adjectives_flashcard3.save

adjectives_flashcard4 = Flashcard.new(flashcard_set_id: adjectives2.id, front: "grand")
Mobility.with_locale(:en) { adjectives_flashcard4.back = "big" }
Mobility.with_locale(:de) { adjectives_flashcard4.back = "groß" }
adjectives_flashcard4.save

# Adjectives Set 3: Feelings
adjectives3 = FlashcardSet.create(language_id: frenchlang.id, card_type: "Adjectives", title: "Feelings")
Mobility.with_locale(:en) { adjectives3.card_type = "Adjectives" }
Mobility.with_locale(:de) { adjectives3.card_type = "Adjektive" }
adjectives3.save!

adjectives_flashcard5 = Flashcard.new(flashcard_set_id: adjectives3.id, front: "heureux")
Mobility.with_locale(:en) { adjectives_flashcard5.back = "happy" }
Mobility.with_locale(:de) { adjectives_flashcard5.back = "glücklich" }
adjectives_flashcard5.save

adjectives_flashcard6 = Flashcard.new(flashcard_set_id: adjectives3.id, front: "triste")
Mobility.with_locale(:en) { adjectives_flashcard6.back = "sad" }
Mobility.with_locale(:de) { adjectives_flashcard6.back = "traurig" }
adjectives_flashcard6.save
