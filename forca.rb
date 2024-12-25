puts "Qual seu nome?"
nome = gets.chomp
nome = nome.downcase.capitalize
system "cls"

puts "Bem vindo #{nome}!"

game = 1
while game > 0

    i = 1
    while i == 1
        puts "\nVocê deseja jogar o modo de jogo de:\n    1 - Uma pessoa, onde uma palavra é gerada automaticamente para você;\n    2 - Duas pessoas, onde um escolhe a palavra e o outro adivinha;"
        print "Insira o numero de participantes (1 ou 2): "
        part = gets.chomp
        
        if part != "1" && part != "2"
            system "cls"
            puts "Você inseriu uma quantidade inválida de participantes.\nPor favor escolha entre 1 ou 2."
        else
            i = 0
            system "cls"
        end
    end

    if part == "2"
        i = 1 
        while i==1
            
            puts "Qual a palavra para a forca?"
            palavra = gets.chomp
            palavra = palavra.downcase.encode("UTF-8")
            
            system "cls" 
            
            j = 1
            while j == 1
                
                puts "Palavra escolhida é: #{palavra.capitalize}."
                puts "Tem certeza que é essa palavra que deseja?"
                confirm = gets.chomp
                confirm = confirm.downcase
                
                if confirm[0] == "s" || confirm[0] == "y"
                    i = 0
                    j = 0
                elsif confirm[0] == "n"
                    i = 1
                    j = 0
                    system "cls"
                else
                    system "cls" 
                    puts "Você inseriu uma resposta inválida, responda a pergunta apenas com sim ou não."
                    j = 1
                end
            end
        end
    end
    
    if part == "1"
        j = 1
        if File.exists?("adult.txt") == false || File.exists?("children.txt") == false
            exit
        end
            
        while j == 1
            puts "Você deseja usar o dicionário para crianças ou para adultos?"
            puts "Por favor digite 'C' para crianças ou 'A' para adultos."
            tipo = gets.chomp.downcase
            if tipo.size > 1
                system "cls"
                puts "Você inseriu mais de um caractere."
            elsif tipo == "a"
                system "cls"
                palavra = File.read("adult.txt").lines[rand(0..125)]
                j = 0
            elsif tipo == "c"
                system "cls"
                palavra = File.read("children.txt").lines[rand(0..39)]
                j = 0
            else
                system "cls"
                puts "Você inseriu uma letra que não é 'C' nem 'A'."
            end
        end
    end
    
    system "cls"
    
    puts "Prepare-se #{nome} pois o jogo já vai começar!"
    
    for i in (0..5)
        if 5-i == 0
            puts "Já!"
        else
            puts 5-i
        end
        sleep (1)
    end
    
    if part == "1"
        tamanho = palavra.size-1
    elsif part == "2"
        tamanho = palavra.size
    end
    
    acento = [tamanho]
    for i in (0...tamanho)
        if palavra[i] == "á" || palavra[i] == "à" || palavra[i] == "â" || palavra[i] == "ã" || palavra[i] == "ä"
            acento[i] = "a"
        elsif palavra[i] == "ç"
            acento[i] = "c"
        elsif palavra[i] == "é" || palavra[i] == "è" || palavra[i] == "ê" || palavra[i] == "ë"
            acento[i] = "e"
        elsif palavra[i] == "í" || palavra[i] == "ì" || palavra[i] == "î" || palavra[i] == "ï"
            acento[i] = "i"
        elsif palavra[i] == "ó" || palavra[i] == "ò" || palavra[i] == "ô" || palavra[i] == "õ" || palavra[i] == "ö"
            acento[i] = "o"
        elsif palavra[i] == "ú" || palavra[i] == "ù" || palavra[i] == "û" || palavra[i] == "ü"
            acento[i] = "u"
        else
            acento[i] = palavra[i]
        end
    end
    
    discover = [tamanho]
    for i in (0...tamanho)
        if palavra[i] == " " || palavra[i] == "-"
            discover[i] = 1
        else
            discover[i] = 0
        end
    end
    
    chars = [26]
    for i in (0...26)
        chars[i] = 0
    end
    
    try = 0
    erros = 0
    times = -1
    i = 1
    while i == 1
        times += 1
        count = 0
        
        system "cls"
        
        if times > 0
            if try == tamanho
                puts "Errou a letra!"
            else
                puts "Acertou #{tamanho-try} letras!"
            end
        end
        
        print "palavra: "
        for j in (0...tamanho)
            if discover[j] == 1
                print "#{palavra[j]} "
            else
                print "_ "
                count += 1
            end
        end
        
        if count == 0
            puts "\nVocê venceu #{nome}!"
            i = 0
        else
            puts "\nFaltam #{count} letras e você ainda tem #{6-erros} chances!"
        end
        
        if i != 0
            j = 1
            while j == 1
                j = 0
                k = 1
                while k == 1
                    if times > 0
                        print "\nLetras já chutadas: "
                        for l in (0...26)
                            if chars[l] != 0
                                print "#{chars[l]} "
                            end
                        end
                    end
                
                    puts "\nQual letra você quer chutar?"
                    letter = gets.chomp
                    
                    if letter.size > 1
                        puts "\nVocê inseriu mais de um caractere, insira apenas um."
                    else
                        k = 0
                    end
                end
                
                if (letter == "á" || letter == "à" || letter == "â" || letter == "ã" || letter == "ä")
                    letter = "a"
                elsif (letter == "ç")
                    letter = "c"
                elsif (letter == "é" || letter == "è" || letter == "ê" || letter == "ë")
                    letter = "e"
                elsif (letter == "í" || letter == "ì" || letter == "î" || letter == "ï")
                    letter = "i"
                elsif (letter == "ó" || letter == "ò" || letter == "ô" || letter == "õ" || letter == "ö")
                    letter = "o"
                elsif (letter == "ú" || letter == "ù" || letter == "û" || letter == "ü")
                    letter = "u"
                end
                
                for k in (0...tamanho)
                    if letter == chars[k]
                        j = 1
                    end
                end
                
                if j == 1
                    puts "\nVocê inseriu uma letra que já tinha chutado antes."
                    print "Letras já chutadas: "
                    for k in (0...26)
                        if chars[k] != 0
                            print "#{chars[k]} "
                        end
                    end
                elsif j == 0
                    chars[times] = letter
                end
            end
            
            try = 0
            for j in (0...tamanho)
                if letter == acento[j]
                    discover[j] = 1
                else
                    try += 1
                end
            end
            
            if try == tamanho
                erros += 1
            end
            
            if erros == 6
                i = 0
                system "cls"
                puts "A palavra era: #{palavra}"
                puts "Você perdeu! Tente jogar uma nova partida!"
            end
        end
    end
    
    for i in (1..8)
        sleep(1)
        print "."
    end
    
    i = 1
    while i == 1
        puts "Deseja jogar novamente?"
        confirm = gets.chomp
        confirm = confirm.downcase
        
        if confirm[0] == "s" || confirm[0] == "y"
            i = 0
            game += 1
            system "cls"
        elsif confirm[0] == "n"
            i = 0
            game = 0
            puts "Jogo finalizado."
        else
            i = 1
            system "cls" 
            puts "Você inseriu uma resposta inválida, responda a pergunta apenas com sim ou não."
        end
    end
end