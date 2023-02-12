%Programm zur Abfrage zweier Zahlen, welche miteinander verglichen werden
%sollen

%Titel - Programm
%prompt_a = "Dieses Programm vergleicht zwei Zahlen miteinander";
prompt_a2 = "Dieses Programm berechnet die Potenz einer Zahl";
disp(prompt_a2)

%Nutzer fragen, ob er das Programm starten möchte
prompt_b = "Möchten Sie das Programm starten? [ja/nein]: ";

st = 1;

%While Schleife - Nutzer-Einagbe
while st == 1
    
%Eingabe für den Nutzer:
    start = input(prompt_b,'s'); %start = Programm starten


%(innere) While-Schleife - Nutzer wird solange gefragt, bis richtige Eingabe
%erfolgt, oder das Programm beendet wird.

    uil = 1; %uil = user input loop

    while uil == 1

    %Bedingung, falls Nutzer: 'ja' eingibt. / Programm wird gestartet...
        if strcmpi(start, 'ja')

           disp("Das Programm wurde gestartet")

           uil = 0;
           st = 0;
           
        elseif strcmpi(start, 'exit')
            
            disp("Programmabbruch...")
            return

    %Bedingung, falls Nutzer: 'nein' eingibt. / Programm wird beendet...
        elseif strcmpi(start, 'nein')
            disp("Das Programm wurde beendet...")
            uil = 2;
            st = 0;

    %Fehlermeldung, es wurde weder 'ja' noch 'nein' eingegeben - Eingabe wird
    %wiederholt...
        else 
            disp(" ")
            disp("Falsche Eingabe: Programmfehler")
            uil = 3;

        end
    end

%Das Programm wurde gestartet... nun wird der Nutzer nach den beiden Zahlen
%gefragt

end

checkn = 1;     %checkn = check numbers

if uil == 2
    checkn = 3;
end
    

while checkn == 1
    if uil == 0
        cfui = 1;            %loop: cfui = check for user input
        cfn1 = 1;            %loop: cfn1 = check for number1
        while cfui == 1
            while cfn1 == 1
                
                prompt_1 = ("Bitte geben Sie ihre erste Zahl(Basis) ein: ");
                disp(" ")
                text1 = input(prompt_1,'s');
             
                et1 = isempty(text1);       %et1 = empty text1 (true=1, wenn Eingabe leer ist, false=0 wenn nicht)
                
                
                zahl1 = str2double(text1);  %Eingabe als einen Zahlenwert festlegen
                test1= isnumeric(text1);    %true=1, wenn es eine Zahl ist, false=0 wenn nicht
                
                isnumber = isnan(zahl1);    %true=1, wenn zahl1 keine Zahl ist [NaN], false=0 wenn doch
                
                pat_kzahl1 = ',';            %Variable um Kommazeichen "," in der Eingabe zu erkennen
                wennkommazahl1 = contains(text1, pat_kzahl1);
                
                
                
                if et1 == 0
                    if isnumber == 0
                        if wennkommazahl1 == 0
                            if(length(text1) <= 10)
                                cfn1 = 0;

                            elseif(length(text1) > 10)
                                disp(" ")
                                disp("Ihre Zahl ist zu groß, bitte geben Sie eine andere Zahl ein.")

                            end
                        elseif wennkommazahl1 == 1
                            disp("Das Kommazeichen ',' wird vom Programm nicht unterstützt!")
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
                
                prompt_2 = ("Bitte geben Sie ihre zweite Zahl(Exponent) ein: ");
                disp(" ")
                text2 = input(prompt_2,'s');
                
               
                et2 = isempty(text2);       %et2 = empty text2 (true=1, wenn Eingabe leer ist, false=0 wenn nicht)
               
                
                zahl2 = str2double(text2); %Eingabe als einen Zahlenwert festlegen
                test2= isnumeric(text2); %true=1, wenn es eine Zahl ist, false=0 wenn nicht
                
                neg_zahl2 = isreal(sqrt(-zahl2)); 
                % Prüft ob die Zahl eine positive oder negative Zahl ist
                % Wenn Eingabe : negative Zahl -> Zahl wird mit "-zahl2"
                % zur positiven Zahl (--zahl = +zahl) wenn Wurzel ziehen
                % dann möglich ist = reale Zahl --> Die Eingabe ist eine
                % negative Zahl = Fehlermeldung
                % true = 1 = negative Zahl, false = 0 = positive Zahl
                
                isdecimal = round(zahl2);
               
                pat = '.';
                wennpunktz2 = contains(text2, pat); %Variable die Prüft ob Eingabe einen Punkt enthält
                %(true = 1 : Eingabe enthält "." | false = 0 : kein ".")
                                                    
                pat_kzahl2 = ',';                    % Check for Komma in Input
                wennkommazahl2 = contains(text2, pat_kzahl2);
            
                isnumber2 = isnan(zahl2); %true=1, wenn zahl2 keine Zahl ist [NaN], false=0 wenn doch
                
                if zahl2 == 0       % " 0 " wird als negative Zahl gezählt, also wird bei Eingabe von " 0 "
                    neg_zahl2 = 0;   % das Programm fortgeführt, denn Potenz " 0 " soll möglich sein.
                    
                end
                if wennkommazahl2 == 0
                    if wennpunktz2 == 0
                        if et2 == 0
                            if isnumber2 == 0 
                                if neg_zahl2 == 0
                                    if(length(text2) <= 10)
                                        disp(" ")
                                        cfn2 = 0;

                                    elseif(length(text2) > 10)
                                        disp(" ")
                                        disp("Ihre Zahl ist zu groß, bitte geben Sie eine andere Zahl ein.")

                                    end
                                elseif neg_zahl2 == 1
                                    disp("Die Eingabe negativer Zahlen ist nicht möglich, bitte eine positive Zahl eingeben")
                                end
                            elseif isnumber2 == 1
                                disp(" ")
                                disp("Sie haben keine Zahl eingegeben, bitte versuchen Sie es erneut")

                            end

                        elseif et2 == 1
                            disp(" ")
                            disp("Sie haben keine Eingabe getätigt, bitte versuchen Sie es erneut.")
                        end
                    elseif wennpunktz2 == 1
                        disp("Für die zweite Zahl können keine Kommazahlen verwendet werden.")
                    end
                
                elseif wennkommazahl2 == 1
                    disp("Das Kommazeichen ',' wird vom Programm nicht unterstützt!")
                end
                
                if cfn1 == 0 || cfn2 == 0
                cfui = 0;
                checkn = 0;
                
                end
            
            end
        end        
    end            
end

erg = 1;
if zahl2 == 0
    erg = 1;
else
    if checkn == 0
        for i=1:zahl2
            erg = zahl1 * erg;

        end
    end
end

disp(zahl1 + " mit " + zahl2 + " potenziert ergibt: " + erg)

%if checkn == 1
    
   %disp(zahl1 + " und " + zahl2 + " werden nun miteinander verglichen.")
   %disp(" ")

   %if zahl1 > zahl2
       %disp(zahl1 + " ist größer als " + zahl2)

   %elseif zahl1 < zahl2
       %disp(zahl1 + " ist kleiner als " + zahl2)

   %elseif zahl1 == zahl2
       %disp("Die beiden Zahlen sind gleichwertig.")

   %end
%end

%if checkn == 0
   %disp("Das Programm wurde beendet.")
%end
   %return

%Zahlen werden auf alles überprüft, es tritt jedoch ein Fehler auf, wenn
% das Komma mit ',' und nicht mit '.' geschrieben wird - aus '3,4' wird dann
% '34'
        
        
      