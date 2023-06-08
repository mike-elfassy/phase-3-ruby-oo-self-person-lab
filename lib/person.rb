# your code goes here

require 'pry'

def between_ten(value) 
    new_value = case value
                    when -Float::INFINITY...0 then 0 
                    when 0...10 then value
                    when 10..Float::INFINITY then 10
                    else 0
                end
    new_value
end

class Person
    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account

    def initialize(
            name,
            bank_account = 25,
            happiness = 8,
            hygiene = 8
        )
        @name = name
        @bank_account = bank_account
        @happiness = between_ten(happiness)
        @hygiene = between_ten(hygiene)
    end

    def happiness=(value)
        @happiness = between_ten(value)
    end

    def hygiene=(value)
        @hygiene = between_ten(value)
    end

    def happy?
        self.happiness > 7
    end

    def clean?
        self.hygiene > 7
    end

    def get_paid(amount)
        self.bank_account += amount
        return "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        return '♪ another one bites the dust ♫'
    end

    def call_friend(friend)
        self.happiness += 3
        friend.happiness += 3
        return "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(person, topic)
        conversation = ''
        case topic
        when 'politics'
            self.happiness -= 2
            person.happiness -= 2
            conversation = 'blah blah partisan blah lobbyist'
        when 'weather'
            self.happiness += 1
            person.happiness += 1
            conversation = 'blah blah sun blah rain'
        else
            conversation = 'blah blah blah blah blah'
        end
        conversation
    end
end