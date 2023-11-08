class Look_that_way

  class << self
    
    def rps
      puts "じゃんけん..."
      
      loop do
        random_rps = rand(3)
        
        puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
        select_num = gets.to_i
        keep_random = random_rps
        @result_rps = nil
        
        if select_num == 0 
          hand = "グー"
        elsif select_num == 1
          hand = "チョキ"
        elsif select_num == 2
          hand = "パー"
        end
        
        if keep_random == 0 
          u_hand = "グー"
        elsif keep_random == 1
          u_hand = "チョキ"
        elsif keep_random == 2
          u_hand = "パー"
        end
        
        #じゃんけんの勝敗制御
        case
        when select_num == keep_random  #あいこの処理redo
          @result_rps = "draw"
        when select_num == 0 && keep_random == 1, select_num == 1 && keep_random == 2, select_num == 2 && keep_random == 0
          @result_rps = "win"
        when select_num == 0 && keep_random == 2, select_num == 1 && keep_random == 0, select_num == 2 && keep_random == 1
          @result_rps = "lose"
        when select_num == 3
          @result_rps = "escape"
        when select_num != (0..3)
          @result_rps = "error"
        end
        
        if @result_rps == "escape" 
          puts "バイバイ！"
          exit
        elsif @result_rps == "error"
          puts "0-3の数字を入力してください。"
          redo
        else
          puts "ホイ！", "-------------------------------------", "あなた：#{hand}を出しました", "相手：#{u_hand}を出しました", "-------------------------------------"
          if @result_rps == "draw" 
            puts "あいこで..."
            redo
          elsif @result_rps == "win" || @result_rps == "lose"
            ltw
          end
        end
      end
    end
    
    #あっち向いてホイの処理
    def ltw
      puts "あっち向いて〜", "0(上) 1(下) 2(左) 3(右)"
      random_ltw = rand(4)
      keep_random2 = random_ltw
      
      
      @select_num2 = gets.to_i
      while @select_num2 > 3
        puts "0-3の数字を入力してください。", "0(上) 1(下) 2(左) 3(右)"
        @select_num2 = gets.to_i
      end
      way = ["上","下","左","右"]
       
      if @select_num2 != keep_random2
        puts "ホイ！", "-------------------------------------", "あなた：#{way[@select_num2]}を出しました", "相手：#{way[keep_random2]}を出しました", "-------------------------------------"
        rps
      else
        if @result_rps == "win"
          puts "ホイ！", "-------------------------------------", "あなた：#{way[@select_num2]}を出しました", "相手：#{way[keep_random2]}を出しました", "-------------------------------------"
          puts "勝ちました！"
          exit
        elsif @result_rps == "lose"
          puts "ホイ！", "-------------------------------------", "あなた：#{way[@select_num2]}を出しました", "相手：#{way[keep_random2]}を出しました", "-------------------------------------"
          puts "負けました..."
          exit
        end
      end
    end
  end
end


Look_that_way.rps()
Look_that_way.ltw()