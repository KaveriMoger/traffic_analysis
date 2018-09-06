require 'set'

# Index 0: unique visitor id's
# Index 1: total time (+OUT, -IN)
# Index 2: count (of OUT)
rooms = Array.new(100){ Array.new(3) }

line = gets # don't care about first line
while(line = $stdin.gets)
  # Get Input (as int if possible)
  vId, rId, ioChar, time = line.split.map{|s| /^[0-9]+$/.match(s) ? s.to_i : s}
  
  # Init Array
  rooms[rId][0] = Set.new() if rooms[rId][0].nil?
  rooms[rId][1] = 0 if rooms[rId][1].nil?
  rooms[rId][2] = 0 if rooms[rId][2].nil?
  
  # visitor(0)
  rooms[rId][0].add(vId)
  
  # time(1),count(2)
  if(ioChar == "I")
    rooms[rId][1] -= time
  else
    rooms[rId][1] += time
    rooms[rId][2] += 1
  end
end

rooms.each_with_index { |v, i|
  next if v[0].nil? # noone entered the room
  printf("Room %d, %d minute average visit, %d visitor(s) total.\n", i, v[1]/v[2], v[0].size())
}
