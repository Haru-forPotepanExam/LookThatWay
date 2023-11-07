class Look_that_way
  class << self
    def rps
      puts "じゃんけん..."
      
      loop do
        random_rps = rand(3)
        
        puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
        select_num = gets.to_i
        keep_random = random_rps
        @result_rps = ""
        
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
        when select_num != (0-3)
          @result_rps = "null"
        end
        
        if @result_rps == "escape"
          puts "バイバイ！"
          break
        elsif @result_rps == "null"
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
      random_ltw = rand(4)
      
      puts "あっち向いて〜","0(上) 1(下) 2(左) 3(右)"
      select_num2 = gets.to_i
      keep_random2 = random_ltw
      result_ltw = ""
      
      if select_num2 == 0
        way = "上"
      elsif select_num2 == 1
        way = "下"
      elsif select_num2 == 2
        way = "左"
      elsif select_num2 == 3
        way = "右"
      end
      
      if keep_random2 == 0
        u_way = "上"
      elsif keep_random2 == 1
        u_way = "下"
      elsif keep_random2 == 2
        u_way = "左"
      elsif keep_random2 == 3
        u_way = "右"
      end
      
      puts "ホイ！", "-------------------------------------", "あなた：#{way}を出しました", "相手：#{u_way}を出しました", "-------------------------------------"
      
      #あっち向いてほいの勝敗制御
      if select_num2 == keep_random2
        result_ltw = "end"
      else
        result_ltw = "continue"
      end
      
      #あっち向いてホイの処理
      case
      when @result_rps == "win" && result_ltw == "end"
        puts "勝ちました！"
        exit
      when @result_rps == "win" && result_ltw == "continue"
        rps
      when @result_rps == "lose" && result_ltw == "end"
        puts "負けました..."
        exit
      when @result_rps == "lose" && result_ltw == "continue"
        rps
      end
    end
  end
end

Look_that_way.rps()
Look_that_way.ltw()