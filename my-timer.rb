def timer
  tick = 0
  cont = 0
  update do
    if tick % 60 == 0
      puts tick
      cont = cont + 1
    elsif tick == 1020
      tick = 0
    end
    tick += 1

  end
end