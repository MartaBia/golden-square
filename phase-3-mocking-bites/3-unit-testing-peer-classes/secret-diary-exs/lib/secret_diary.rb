class SecretDiary
  def initialize(diary) 
    @diary = diary
    @locked = true
  end

  def read
    fail "Go away!" if @locked
    return @diary.read
  end

  def lock
    return @locked = true
  end

  def unlock
    return @locked = false
  end
end