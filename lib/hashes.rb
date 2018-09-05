# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
    hash = Hash.new
    str.split.each {|el| hash[el] = el.length}
    hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
    hash.sort_by{ |key,val| val }[-1].first
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
    newer.each { |key, val| older[key] = val }
    older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
    hash = Hash.new(0)
    word.each_char {|ltr| hash[ltr] += 1}
    hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
    result = []
    arr.each{|el| result.push(el) if !result.include?(el) }
    result
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
    hash = {even: 0, odd: 0}
    numbers.each{|el| if el % 2 == 0 then hash[:even] += 1 else hash[:odd] += 1 end}
    hash
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are 
# lower case.
def most_common_vowel(string)
    hash = Hash.new(0)
    string.each_char{|el| hash[el] += 1 if "aeiou".include? el}
    hash.sort_by{ |k,val| val }[-1][0] 
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)

    result = []

    arr = students.select{|k,v| v >= 7}.map{|el| el[0] }

    arr.each_with_index do |el, idx|

        break if idx == arr.length - 1

        while idx < arr.length - 1 && idx
            result.push([el, arr[idx + 1]])
            idx += 1
        end

    end

    result
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
    specimens.uniq.length ** 2
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
    normal_sign.downcase! && vandalized_sign.downcase!

    vandal_char_count = Hash.new(0)
    vandalized_sign.delete(" ").each_char{ |ltr| vandal_char_count[ltr] += 1 }

    vandal_char_count.all?{|k,v| normal_sign.count(k) >= v}
end