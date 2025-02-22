//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var alphabet = [String]()
alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

var isPlaying = true

repeat {
    
    
    let randomWord = allTheWords.randomElement()
    let word = randomWord ?? ""

    //var charNum = word.count
    var letterGuessed = Set<String>()
    var letterArray = [String]()

    print()

    for _ in word {
//        print(char, terminator: " ")
        letterArray.append("_")
    }

    print()

    print("""
LET'S PLAY HANGMAN, 🤩🤩🤩!!!

    +____________
    |          |
    |
    |
    |
    |
____|_______________________________________

""")
    print()
    print("Guess a letter!!!")
    print()
    var attemptsCount = 0
//    var correctGuessCount = 0
    var correctGuessCount = 0

    while attemptsCount < 6 {
        
        for char in letterArray {
            print(char, terminator: " ")
        }
        print()
        let guessLetter = readLine() ?? ""
        let guess = guessLetter.lowercased()
        
        if guess.count > 1 || !alphabet.contains(guess){
            print("Please enter something valid!!!")
            continue
        }
        
        if word.contains(guess) && !letterGuessed.contains(guess) {
            print("Nice Job.... 👍")
            correctGuessCount += 1
            letterGuessed.insert(guess)
            
            for (index, char) in word.enumerated() {

                if String(char) == guess {
                    letterArray[index] = guess
                }
            }
            if !letterArray.contains("_") {
                for char in letterArray {
                    print(char, terminator: " ")
                }
                print()
                print("👏🎆👏🎆👏🎆👏🎆👏🎆👏🎆👏🎆👏🎆👏🎆")
                sleep(1)
                print("👏🎆👏🎆👏🎆👏🎆👏🎆👏🎆👏🎆👏🎆👏🎆")
                sleep(1)
                print("Congratulations You've Beaten Me This Time")
                print()
                print("Would you like to play again?")
                let playAgain = readLine() ?? " "
                if playAgain.lowercased() == "yes" {
                    isPlaying = true
                } else {
                    isPlaying = false
                    print("Thanks for playing")
                    break
                }
            }
            
        } else if !word.contains(guess) && !letterGuessed.contains(guess) && guess.count == 1 {
            print()
//            sleep(1)
//            print("Not in word try again")
            letterGuessed.insert(guess)
            attemptsCount += 1
            switch attemptsCount {
            case 1:
                print("""
    +____________
    |          |
    |          O
    |
    |
    |
____|_______________________________________
Oops, You have 5 more attempts!!
""")
                print()
                print("Guessed Letters..... \(letterGuessed)")
            case 2:
//                sleep(1)
                print("""
    +____________
    |          |
    |          O
    |          |
    |
    |
____|_______________________________________
Oops, You have 4 more attempts!!
""")
                print()
                print("Guessed Letters..... \(letterGuessed)")
            case 3:
//                sleep(1)
                print("""
    +____________
    |          |
    |          O
    |         /|
    |
    |
____|_______________________________________
Oops, You have 3 more attempts!!
""")
                print()
                print("Guessed Letters..... \(letterGuessed)")
            case 4:
//                sleep(1)
                print("""
    +____________
    |          |
    |          O
    |         /|\\
    |
    |
____|_______________________________________
Oops, You have 2 more attempts!!
""")
                print()
                print("Guessed Letters..... \(letterGuessed)")
            case 5:
//                sleep(1)
                print("""
    +____________
    |          |
    |          O
    |         /|\\
    |         /
    |
____|_______________________________________
Oops, You have 1 more attempt!!
""")
                print()
                print("Guessed Letters..... \(letterGuessed)")
            case 6:
//                sleep(1)
                print("""
    +____________
    |          |
    |          O
    |         /|\\
    |         / \\
    |
____|_______________________________________
Oops, You're Dead ☠️😵☠️😵☠️😵☠️!!
""")
                print("The correct word was \"\(word.uppercased())\"!!!")
                print()
                sleep(1)
                print("Would you like to play again?")
                let playAgain = readLine() ?? " "
                if playAgain.lowercased() == "yes" {
                    isPlaying = true
                } else {
                    isPlaying = false
                    print("Thanks for playing")
                }

            default:
                print("ERROR")
            }
        } else if letterGuessed.contains(guess) {
            print("You've already tried that letter, please try another letter")
            print()
            print("Guessed Letters..... \(letterGuessed)")
        }
    }
} while isPlaying == true
