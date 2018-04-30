class Grid
    attr_accessor :array
    def initialize
      @array = []
      prepare_grid
    end
  
    def prepare_grid
       @array << Array.new(4, "*")
       end
  
    def pretty_print
        puts "_______________________"
        print "\n"
      @array.each_with_index do |row, i|
        row.each_with_index do |col, j|
            
          print "| #{@array[i][j]} | "
        end
       print "\n"
        puts "_______________________"
      end
    end

    def pretty_print2
      puts "___________________________________"
      print "\n"
    @array.each_with_index do |row, i|
      row.each_with_index do |col, j|
          
        print "| #{@array[i][j]} | "
      end
     print "\n"
      puts "___________________________________\n\n"
    end
    
  end

    def map
      @array[0][0]=$array_comb[0]
      @array[0][1]=$array_comb[1]
      @array[0][2]=$array_comb[2]
      @array[0][3]=$array_comb[3]
      
      end
   end
