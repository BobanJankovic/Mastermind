
class Mastermind

# O--> jedan pogodjen i na pravom je mestu
# P--> jedan pogodjen i nije na pravom mestu
# X--> nema ga u kombinaciji

load 'grid.rb'
#Spisak kombinacija:
#all=["zvezda","skocko", "karo", "pik","tref","herc"]
#-----------------------------------------------------------------------
def initialize(name1)
    @player1=Player1.new(name1)
    @grid=Grid.new()
    @grid.pretty_print
    puts "\nYour game is ready!!!\n\n"
    game 
end

#-----------------------------------------------------------------------
def game
    random_color
    #-----------------
    combination #1
    @grid.map
    @grid.pretty_print2
    return if matching==4
    #-----------------
    combination #2
    @grid.map
    @grid.pretty_print2
    return if matching==4
    #-----------------
    combination #3
    @grid.map
    @grid.pretty_print2
    return if matching==4
    #-----------------
    combination #4
    @grid.map
    @grid.pretty_print2
    return if matching==4
    #-----------------
    combination #5
    @grid.map
    @grid.pretty_print2
    return if matching==4
    #-----------------
    combination #6
    @grid.map
    @grid.pretty_print2
    return if matching==4
    #-----------------
    combination #7
    @grid.map
    @grid.pretty_print2
    return if matching==4
    #----------------- 
    puts " Correct answer is #{$all1}"
end

#-----------------------------------------------------------------------
def combination
    all=["zvezda","skocko", "karo", "pik","tref","herc"]
    $array_comb=[]
    puts "#{@player1.name1} what is your combination?"
    until $array_comb.length == 4
            my_comb=gets.chomp
            if all.include?my_comb then
                $array_comb << my_comb
            else 
                until all.include?my_comb 
                    puts "#{@player1.name1}, only defined colors!!!"
                    my_comb=gets.chomp
                    if all.include?my_comb then
                        $array_comb << my_comb
                    end
                end
            end
    end
    #puts "My combination is #{$array_comb} "
    return $array_comb
end
$all1=[]
#-----------------------------------------------------------------------
def random_color
    all=["zvezda","skocko", "karo", "pik","tref","herc"]

    all.each do |x|
        until $all1.length == 4
            a=rand(0..5)
            x=all[a]
            $all1 << x
        end
    end
    puts "My random combination is #{$all1} "
    return $all1
end
#-----------------------------------------------------------------------
def matching
    $a=0
    $b=0
    $c=0
    $match=[] 
    $check=[]

    $array_comb.each_with_index do |col, position| 
        
        if $all1[position] == col then
           $match << "a"
           $check << col
           p $check
           
        elsif ($array_comb.include?$all1[position])   then
            $match << "b"
        else $match << "c" 
       end
        end 
    
    
    $match.each do |x|
    
    if x=="a" then
        $a += 1
    elsif x== "b" then
        $b += 1
    elsif x== "c" then
        $c += 1
    end
    end
    p " Pogodjene na mestu #{$a} "
    p " Pogodjene ali nisu na mestu #{$b}"
    p " Nema uopste #{$c} "
    picture
    return  $a  
    
end
#-----------------------------------------------------------------------
def picture
    if $a==4 then 
        puts "_________\n\n| O | O |\n_________\n\n| O | O |\n_________"
        puts " VICTORY"
    elsif $a==3 && $b==1 then
        puts "_________\n\n| O | O |\n_________\n\n| O | P |\n_________"
    elsif $a==2 && $b==2 then
        puts "_________\n\n| O | O |\n_________\n\n| P | P |\n_________"
    elsif $a==1 && $b==3 then
        puts "_________\n\n| O | P |\n_________\n\n| P | P |\n_________"
    elsif $b==4 then
        puts "_________\n\n| P | P |\n_________\n\n| P | P |\n_________"
    elsif $c==4 then
        puts "_________\n\n| X | X |\n_________\n\n| X | X |\n_________"
    elsif $c==3 && $b==1  then
        puts "_________\n\n| P | X |\n_________\n\n| X | X |\n_________"
    elsif $c==2 && $b==2  then
        puts "_________\n\n| P | P |\n_________\n\n| X | X |\n_________"
    elsif $c==1 && $b==3  then
        puts "_________\n\n| P | P |\n_________\n\n| P | X |\n_________"
    elsif $c==1 && $a==3  then
        puts "_________\n\n| O | O |\n_________\n\n| O | X |\n_________"
    elsif $c==2 && $a==2  then
        puts "_________\n\n| O | O |\n_________\n\n| X | X |\n_________"
    elsif $c==3 && $a==1  then
        puts "_________\n\n| O | X |\n_________\n\n| X | X |\n_________"
    elsif $c==1 && $a==2 && $b==1  then
        puts "_________\n\n| O | O |\n_________\n\n| P | X |\n_________"
    elsif $c==2 && $a==1 && $b==1  then
        puts "_________\n\n| O | P |\n_________\n\n| X | X |\n_________"
    elsif $c==1 && $a==1 && $b==2  then
        puts "_________\n\n| O | P |\n_________\n\n| P | X |\n_________"

    end
end
#--------------------------------------------------------------------------
class Player1
    
    attr_accessor :name1

    def initialize(name1)
    @name1 = name1
    end
end

end

a=Mastermind.new("Boban")



