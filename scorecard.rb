class Scorecard

  def initialize
    @scoreArr = [1,2,3,4,5,6,7,8,9,10]
    @total = 0
    @strike = false
    @spare = false
  end

  def addScore(firstBowl, secondBowl)
    #Strike
    if firstBowl == 10
      @strike = true
      nextFrame
      totalFrame(firstBowl, secondBowl)
      tenthFrame
      gameCheck
    #Strike last frame, strike this frame
  elsif firstBowl == 10 && @strike == true
      nextFrame
      strike(firstBowl, secondBowl)
      totalFrame(firstBowl, secondBowl)
      tenthFrame
      gameCheck
    #Strike last frame, no strike this frame
    elsif firstBowl < 10 && @strike == true
      @strike = false
      nextFrame
      strike(firstBowl, secondBowl)
      totalFrame(firstBowl, secondBowl)
      tenthFrame
      gameCheck
    #Spare
    elsif firstBowl < 10 && firstBowl + secondBowl == 10
      @spare = true
      nextFrame
      totalFrame(firstBowl, secondBowl)
      tenthFrame
      gameCheck
    #Spare last frame, spare this frame
    elsif firstBowl < 10 && firstBowl + secondBowl == 10 && @spare == true
      nextFrame
      spare(firstBowl)
      totalFrame(firstBowl, secondBowl)
      tenthFrame
      gameCheck
    #Spare last frame, no spare this frame
    elsif firstBowl < 10 && @spare == true
      @spare = false
      nextFrame
      spare(firstBowl)
      totalFrame(firstBowl, secondBowl)
      tenthFrame
      gameCheck
    #Normal roll
    else
      nextFrame
      totalFrame(firstBowl, secondBowl)
      tenthFrame
      gameCheck
    end
  end

  def strike(firstBowl, secondBowl)
    firstBowl = firstBowl * 2
    secondBowl = secondBowl * 2
  end

  def spare(firstBowl)
    firstBowl = firstBowl * 2
  end

  def totalFrame(firstBowl, secondBowl)
    @total += firstBowl + secondBowl
  end

  def nextFrame
    @scoreArr.shift
  end

  def tenthFrame
    if @scoreArr.empty? && @strike == true
      @scoreArr += [11,12]
    elsif @scoreArr.empty? && @spare == true
      @scoreArr << 11
    end
  end

  def gameCheck
    if @scoreArr.empty?
      puts "Game Over, your final score was: #{@total}"
      exit
    else
      puts "Your current total is #{@total}"
    end
  end
end

#Example Game
scorecard = Scorecard.new
scorecard.addScore(1, 1)
scorecard.addScore(1, 1)
scorecard.addScore(8, 2)
#Spare on frame 3 so first bowl is double on next bowl
scorecard.addScore(1, 1)
scorecard.addScore(1, 1)
scorecard.addScore(1, 1)
scorecard.addScore(1, 1)
scorecard.addScore(1, 1)
scorecard.addScore(1, 1)
scorecard.addScore(10, 0)
#Strike on 10th frame, so 2 extra bowls permitted
scorecard.addScore(1, 1)
scorecard.addScore(1, 1)
