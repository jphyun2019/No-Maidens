require 'date'
require 'json'

print "\e[8;15;36t"
class String
    def numeric?
      Float(self) != nil rescue false
    end
end

done = false
while not done
    file = File.read('log.json')
    data_hash = JSON.parse(file)


    today = Date.today
    epoch = Date.new(2022,6,1)
    d = (today-epoch).to_i

    today_completed = false
    for i in data_hash['days']
        if i == d
            today_completed = true
        end
    end
    diff = data_hash['difficulty']




    counter = 0
    current_streak = 0
    highest_streak = 0
    level = 1
    while counter < d

        exists = false
        for i in data_hash['days']
            if i == counter
                exists = true
                current_streak +=1
                level +=1
                if current_streak > highest_streak
                    highest_streak = current_streak
                end

            end
        end
        if !exists
            current_streak = 0

            if(level != 1)
                level-=1
            end

        end
        counter +=1
    end
    if today_completed
        current_streak +=1
        level+=1
        if current_streak > highest_streak
            highest_streak = current_streak
        end
    end






    puts "\n\n\tPull-Up Some Bitches\n\t   by: Jonny Five\n===================================="



    puts "  Current Streak: " + current_streak.to_s
    puts "  Highest Streak: " + highest_streak.to_s
    puts "===================================="
    puts "  Level: " + level.to_s
    puts "  Difficulty: " + diff.to_s


    if today_completed

        print "  Challenge Completed Today\n====================================\n\n  "
        input = gets.to_s.chomp
        if input == 'u'

            data_hash['days'].delete(d)
            File.write('log.json', JSON.dump(data_hash))
            puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        elsif input == 'c'
            done = true

        elsif input == 'd'
            print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n  Change Difficulty\n====================================\n  Current Difficulty: " + diff.to_s + "\n====================================\n  Type a New Difficulty:\n\n  "
            inputt = gets.to_s.chomp

            if inputt.numeric?
                
                data_hash['difficulty'] = inputt.to_f
                File.write('log.json', JSON.dump(data_hash))
            end
            puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"


        else
            puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

        end


    else
        pulls = 2 + (diff.to_f*Math.sqrt(level.to_f)).round()
        puts "  Challenge: " + pulls.to_s + " Pull-Ups"
        print "====================================\n\t Type 'y' to Complete\n\n  "
        input = gets.to_s.chomp


        if input == 'y'

            data_hash['days'].append(d)
            File.write('log.json', JSON.dump(data_hash))
            puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        elsif input == 'c'
            done = true

        elsif input == 'd'
            print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n  Change Difficulty\n====================================\n  Current Difficulty: " + diff.to_s + "\n====================================\n  Type a New Difficulty:\n\n  "
            inputt = gets.to_s.chomp

            if inputt.numeric?
                
                data_hash['difficulty'] = inputt.to_f
                File.write('log.json', JSON.dump(data_hash))
            end
            puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        else
            puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        end

    end


end



