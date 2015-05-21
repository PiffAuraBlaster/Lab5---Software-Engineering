def lines(brd)
  a = brd.each_slice(3).to_a
  a += a.transpose
  a += [brd.values_at(0,4,8),brd.values_at(2,4,6)]
  return a
end

plrs = ["x","o"]
brd = Array.new(9," ")
until not brd.include?(" ") or (lines(brd).find{|line| line[0] != " " and line.uniq.length == 1})
  puts brd.each_slice(3).to_a.map{|r|r.join(" | ")}.join("\n- * - * -\n") + "\n"
  #if x turn checks if valid move.
  
  print "Enter a valid move for #{plrs[0]}:  "
  move = gets.to_i
  while(brd[move] != " ")
    print "#{move} is not valid. Enter a valid move for #{plrs[0]}:  "
    move = gets.to_i
  end
  brd[move]=plrs[0]
  plrs.rotate!
end
w = lines(brd).find{|l| l[0] != " " and l.uniq.length == 1}
w = w ? w[0] : false
if w
  puts "Game over, player #{w} wins!"
else
  puts "It's a cat's game."
end