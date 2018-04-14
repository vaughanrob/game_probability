#Gets the input for the program from a file
class UserInput

    attr_reader :input_array, :number_of_cases

    #initializes the instance variables
    def initialize 
        @input_array = [] #raw input from the file
        @number_of_cases = 0 #number of individual cases in the file
        
    end

    #Reads the input file and stores the strings in an array
    def readfile

        input_file = File.open("game.in", "r")
        input_file.each_line do |line|
            @input_array << line #Appends each line to array
        end
        input_file.close
        @number_of_cases = @input_array.shift.to_i #shifts array to saves first element in variable
        #array acts like a queue with shifting first element
    end

    #shifts the array popping an element out and returning it
    def getnumber 
        return @input_array.shift.to_i

    end

    #shifts the array popping an element out and splitting it into two elements and returning it
    def getitemprobability
        return @input_array.shift.split(" ")
    end

    #shifts the array popping an element out and returning it
    def getmaxattemps
        return @input_array.shift.to_i

    end

    #Gets the amount and probability value and splitting it into different variables
    def getitemvalues(amount_array, probability_array)

        temp = self.getitemprobability

        amount = temp[0].to_i
        probability = temp[1].to_f

        #appends the amount and probability to thier respective arrays
        amount_array << amount 
        probability_array << probability

    end

    #iterates through the data, and builds objects to represents it
    def builditemobject

        item_amount, item_probability = Array.new, Array.new
        for cases in 1 .. number_items = self.getnumber

            self.getitemvalues(item_amount, item_probability)
        end

        max_attemps = self.getmaxattemps
        #builds a object for the current case using info gathered
        item = CaseInformation.new(number_items, item_amount, item_probability, max_attemps)
        return item

    end


end

#Groups each case from the file into a single class
class CaseInformation

    attr_reader :number_items, :item_amount, :item_probability, :max_attemps

    def initialize(num, amount, prob, attemps)

        @number_items = num
        @item_amount = amount
        @item_probability = prob
        @max_attemps = attemps
    end

end

#Calculates and prints the probability of getting the items for this specific case
class CalculateProbability

    def initialize(item)

        @item_info = item

        @max_attemps = @item_info.max_attemps #max number of tries on the items

        array_size = @max_attemps + 1

        #The arrays that calculate the probability
        @current_prob = Array.new(array_size, 0.0)
        @next_prob = Array.new(array_size, 0.0)
        
        

    end

    #Calculates the probability that you will get the desired number of each type of item
    def calculate

        @current_prob[0] = 1.0 #set up the starting value of the array

        for item_type in 0 .. @item_info.number_items - 1
            
            for current_item in 0 .. @item_info.item_amount[item_type] - 1
            
                self.currentprob(item_type)
                self.nextprob(item_type)
                self.arrayswap

            end

        end

        self.printvalue

    end

    #Loops through the current prob array and calculates the value for each element
    def currentprob(item_type)

        for current_value in 0 .. @max_attemps - 1
            @current_prob[current_value + 1] += @current_prob[current_value] * (1.0 - @item_info.item_probability[item_type])
        end
    end

    #Loops through the next prob array and calculates the value for each element using the current array
    def nextprob(item_type)

        @next_prob.fill(0.0)
     
        for current_value in 0 .. @max_attemps - 1

            @next_prob[current_value + 1] += @current_prob[current_value] * @item_info.item_probability[item_type]
        end

    end

    #Swaps the contents of the current array and the next array
    def arrayswap

        swap = @current_prob
        @current_prob = @next_prob
        @next_prob = swap

    end

    def printvalue

        #prints the probability of getting the items
        answer = 0.0
        for current_value in  0 .. @max_attemps
            answer += @current_prob[current_value]
        end

        puts '%.3f' % answer

    end

end

#Starts the program and initializes the array and the other classes
class Main

    def initialize

        @input = UserInput.new
        @item_list = Array.new
        @input.readfile
        self.buildarray

    end

    #builds an array of CaseInformation objects so it can be easily accessed
    def buildarray

        for cases in 0 .. @input.number_of_cases-1
            @item_list << @input.builditemobject #Makes array of CaseInformation objects
        end
    end

    def run


        @item_list.each do |item|

            currentitem = CalculateProbability.new(item) #Calculates the probability of each object
            currentitem.calculate
        end
        
    end

end

Main.new.run #Runs the main of the program
