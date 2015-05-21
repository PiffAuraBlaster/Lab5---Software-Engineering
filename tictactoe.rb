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

  #Computer AI moves as O. Checks if his space is a valid move and if so goes immediately in that space.
  if plrs[0] == "o"
    move = 0
    while(brd[move] != " ")
      move += 1
    end
    brd[move]=plrs[0]
    plrs.rotate!
  end


  #Player now only moves as X.
  print "Enter a valid move for X"
  move = gets.to_i
  while(brd[move] != " ")
    print "#{move} is not valid. Enter a valid move for X:  "
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