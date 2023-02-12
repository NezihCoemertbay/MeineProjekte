%Programm zur Abfrage zweier Zahlen, welche miteinander verglichen werden
%sollen

%Titel - Programm
prompt_a = "Dieses Programm vergleicht zwei Zahlen miteinander";
disp(prompt_a)

%Nutzer fragen, ob er das Programm starten möchte
prompt_b = "Möchten Sie das Programm starten? [ja/nein]: ";

f = 1;

%While Schleife - Nutzer-Einagbe
while f == 1
    
%Eingabe für den Nutzer:
    start = input(prompt_b,'s');


%(innere) While-Schleife - Nutzer wird solange gefragt, bis richtige Eingabe
%erfolgt, oder das Programm beendet wird.

    a = 1;

    while a == 1

    %Bedingung, falls Nutzer: 'ja' eingibt. / Programm wird gestartet...
        if strcmpi(start, 'ja')

           disp("Das Programm wurde gestartet")

           a = 0;
           f = 0;

    %Bedingung, falls Nutzer: 'nein' eingibt. / Programm wird beendet...
        elseif strcmpi(start, 'nein')
            disp("Das Programm wurde beendet...")
            a = 2;
            f = 0;

    %Fehlermeldung, es wurde weder 'ja' noch 'nein' eingegeben - Eingabe wird
    %wiederholt...
        else 
            disp(" ")
            disp("Falsche Eingabe: Programmfehler")
            a = 3;

        end
    end

%Das Programm wurde gestartet... nun wird der Nutzer nach den beiden Zahlen
%gefragt

end

l = 1;

if a == 2
    l = 3;
end
    

while l == 1
    if a == 0
        cfui = 1;            %loop: cfui = check for user input
        cfn1 = 1;            %loop: cfn1 = check for number1
        while cfui == 1
            while cfn1 == 1
                
                prompt_1 = ("Bitte geben Sie ihre erste Zahl ein: ");
                disp(" ")
                text1 = input(prompt_1,'s');
             
                et1 = isempty(text1);       %et1 = empty text1 (true=1, wenn Eingabe leer ist, false=0 wenn nicht)
                
                
                zahl1 = str2double(text1); %Eingabe als einen Zahlenwert festlegen
                test1= isnumeric(text1); %true=1, wenn es eine Zahl ist, false=0 wenn nicht
                
                isnumber = isnan(zahl1); %true=1, wenn zahl1 keine Zahl ist [NaN], false=0 wenn doch
                
                if et1 == 0
                    if isnumber == 0
                        if(length(text1) <= 10)
                            cfn1 = 0;
                        
                        elseif(length(text1) > 10)
                            disp(" ")
                            disp("Ihre Zahl ist zu groß, bitte geben Sie eine andere Zahl ein.")
                            
                        end

                    elseif isnumber == 1
                        disp(" ")
                        disp("Sie haben keine Zahl eingegeben, bitte versuchen Sie es erneut.")
                    
                    end
                    
                elseif et1 == 1
                    disp(" ")
                    disp("Sie haben keine Eingabe getätigt, bitte versuchen Sie es erneut.")
                end
                
            end
        
                    
                    cfn2 = 1;        %loop: cfn2 = check for number2
        
        

            while cfn2 == 1
                
                prompt_2 = ("Bitte geben Sie ihre zweite Zahl ein: ");
                disp(" ")
                text2 = input(prompt_2,'s');
                
                et2 = isempty(text2);       %et2 = empty text2 (true=1, wenn Eingabe leer ist, false=0 wenn nicht)
                
                
                zahl2 = str2double(text2); %Eingabe als einen Zahlenwert festlegen
                test2= isnumeric(text2); %true=1, wenn es eine Zahl ist, false=0 wenn nicht
                
                isnumber2 = isnan(zahl2); %true=1, wenn zahl2 keine Zahl ist [NaN], false=0 wenn doch
                
                if et2 == 0
                    if isnumber2 == 0
                        if(length(text2) <= 10)
                            disp(" ")
                            cfn2 = 0;
                        
                        elseif(length(text2) > 10)
                            disp(" ")
                            disp("Ihre Zahl ist zu groß, bitte geben Sie eine andere Zahl ein.")
                            
                        end

                    elseif isnumber2 == 1
                        disp(" ")
                        disp("Sie haben keine Zahl eingegeben, bitte versuchen Sie es erneut")
                    
                    end
                    
                elseif et2 == 1
                    disp(" ")
                    disp("Sie haben keine Eingabe getätigt, bitte versuchen Sie es erneut.")
                end
            
            if cfn1 == 0 || cfn2 == 0
                cfui = 0;
                l = 0;
            end
            
            end
        end        
    end            
end
    
if l == 0
    
    disp(zahl1 + " und " + zahl2 + " werden nun miteinander verglichen.")
    disp(" ")

    if zahl1 > zahl2
        disp(zahl1 + " ist größer als " + zahl2)

    elseif zahl1 < zahl2
        disp(zahl1 + " ist kleiner als " + zahl2)

    elseif zahl1 == zahl2
        disp("Die beiden Zahlen sind gleichwertig.")

    end
end

if l == 0
    disp("Das Programm wurde beendet.")
end
    return

%Zahlen werden auf alles überprüft, es tritt jedoch ein Fehler auf, wenn
% das Komma mit ',' und nicht mit '.' geschrieben wird - aus '3,4' wird dann
% '34'
        
        
      