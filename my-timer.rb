def timer
  tick = 0
  update do
    if tick % 60 == 0
      puts tick
    elsif tick >= 320
      tick = 0
    end
    tick += 1
  end
end