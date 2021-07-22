# AtCoder ABC207 A-Repression
#

def chk_range(n)
  raise StandardError, "over range (1<= n <= 100: #{n}" if n < 1 || n > 100
end

a0 = STDIN.gets.chomp.split
n = Array.new
begin
  n[0] = a0[0].to_i
  chk_range(n[0])
  n[1] = a0[1].to_i
  chk_range(n[1])
  n[2] = a0[2].to_i
  chk_range(n[2])
rescue StandardError => e
  raise e
end

n2 = n.sort[1..2]
a = n2[0] + n2[1]

puts a

#---
