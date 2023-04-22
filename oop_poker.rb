class Poker
  attr_reader :player_card1, :player_card2, :dealer_card1, :dealer_card2
  
  def initialize
    @numbers = ("1".."13").to_a
    @numbers[0] ="A"
    @numbers[10] ="J"
    @numbers[11] ="Q"
    @numbers[12] ="K"
    @player_card1 = {mark: get_mark, number: get_number}
    @player_card2 = {mark: get_mark, number: get_number}
    @dealer_card1 = {mark: get_mark, number: get_number}
    @dealer_card2 = {mark: get_mark, number: get_number}
  end
    
  def get_mark
    mark = ["ハート", "スペード", "クラブ", "ダイヤ"].sample
  end
  
  def get_number
    number = @numbers.sample
  end
  
  def hand(card1, card2)
    if straight?(card1, card2)
      return "ストレート"
    elsif card1[:number] == card2[:number]
      return "ペア"
    else
      return "ハイカード"
    end
      
  end
  
  def straight?(card1, card2)
    if @numbers.index(card1[:number]) + 1 == @numbers.index(card2[:number])
      true
    elsif (@numbers.index(card1[:number]) == 12) && (@numbers.index(card1[:number]) == 0)
      true
    else
      false
    end
  end
  
end

poker = Poker.new
puts "ポーカーを開始します。"
puts "あなたの引いたカードは#{poker.player_card1[:mark]}の#{poker.player_card1[:number]}です"
puts "あなたの引いたカードは#{poker.player_card2[:mark]}の#{poker.player_card2[:number]}です"
puts "ディーラーの引いたカードは#{poker.dealer_card1[:mark]}の#{poker.dealer_card1[:number]}です"
puts "ディーラーの引いたカードは#{poker.dealer_card2[:mark]}の#{poker.dealer_card2[:number]}です"
puts "あなたの役は#{poker.hand(poker.player_card1, poker.player_card2)}です"
puts "ディーラーの役は#{poker.hand(poker.dealer_card1, poker.dealer_card2)}です"
