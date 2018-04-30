
class Mastermind

# O--> rigtht place and right symbol
# P--> wrong place, right symbol
# X--> wrong symbol

load 'grid.rb'
#List od symbols:
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
    #puts "My random combination is #{$all1} "
    return $all1
end
#-----------------------------------------------------------------------
def matching
    $a=0
    $b=0
    $c=0
    $match=[] 
    $check=[]

    #Caunting matches
    $i=0
    #Mutuall symbols
    $r=[]  
    #Remaining symbols
    $t=[]
    
    $array_comb.each_with_index do |col,ind|
        if $all1[ind]==col
            a= col.split(" ")
            #p a
            $r<<col
            $match << "a"
            $i+=1
            puts "Matching symbols #{$i}"
        else $t << col 
        end
    end
    puts "Common symbols #{$r}"
    
    puts "Remaining symbols in t: #{$t}" 
    
    $y=[]
    $all1.each_with_index do |col,ind|
        if $array_comb[ind]==col
        else $y << col 
     end
    end
    
    puts "Remaining symbols in y: #{$y}"
    
    if $r.length > 0 then
        $y.each_with_index do |el, ind|
            if $t.include?$y[ind] then
                $match << "b"
                $t.delete($y[ind])
                #$y.delete($t[ind])
    
             else $match << "c"
            end
        end
    elsif (0..3).each do |x|
        if $all1.include?$array_comb[x] then
            $match << "b"
        else $match << "c"
        end
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
    p " Right place and right symbol #{$a} "
    p " Wrong place, right symbol #{$b}"
    p " Wrong symbol #{$c} "
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







