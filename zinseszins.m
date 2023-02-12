function [] = zinseszinsgruppe01(jahre,zinssatz,anlage) % ohne [gesamtwert,texte] um bei der Ausgabe: ans = "gesamtwert" zu vermeiden...
%Diese Funktion berechnet ...
    %Beispiel zum Unterfunktionsaufruf: 
    %[korrekt,jahrtext] = pruefjahr(jahre);
   
    [istkorrekt1, text1] = pruefjahr(jahre);
    

    [istkorrekt2, text2] = pruefzins(zinssatz);
    

    [istkorrekt3, text3] = pruefanlage(anlage);
    

    if istkorrekt1 == 1 && text1 == "" && istkorrekt2 == 1 && text2 == "" && istkorrekt3 == 1 && text3 == ""
        disp(" ")
        texte = "Die Rechnung wird gestartet...";
        disp(texte)
        disp(" ")

        for i=0:jahre
        faktor = (1 + zinssatz*0.01)^i;
        gesamtwert = anlage  * faktor;
        gesamtwert = round(gesamtwert,2);
        format short g
        pause(0.5);
        disp("Kapital im " + i + ". Jahr: " + gesamtwert + "€")
        
        end

        % "gesamtwert" Validierung
        
        if gesamtwert >= 0 
            disp("Die Rechnung wurde überprüft und das Ergebnis wird ausgegeben...")
            pause(0.75);
            texte =  "Ihr Gesamtkapital: " + gesamtwert + "€.";
            disp(" ")
            disp(texte) 
        end

    
    else
        texte = "Fehler, Rechnung nicht durchführbar.";
        disp(texte)

    end
    
    
    

        
end
% Wir haben es nicht hinbekommen, die elseif-Texte im Command Window als Antwort
% auf falsche Eingaben anzuzeigen, es kamen immer Systemfehler
% (automatische Fehlanzeigen) wie bspw. 


function [istkorrekt1,text1] = pruefjahr(jahre)
%Diese Funktion prüft...
%     Beispiel zur Rückgabe
%     if jahre == 5
%         istkorrekt = true;
%         text1= ""
%     else
%         text1 = "Anzahl der Jahre ist falsch";
%     end

    %Validierung der Eingabe: Jahre
    %jahre_pat = 1;
    %jahre_array = num2str(jahre);
    %jahre_non_numbers = isstrprop(jahre,'alpha'); %Prüft ob Eingabe von Jahre nur Zahlen und nichts anderes enthält Zahlen = 0 , alles andere = 1
    %jahre_check_non_numbers = ismember(jahre_pat, jahre_non_numbers); %Wenn die 1 in dem Array "jahre_non_numbers" enthalten ist, ist diese Variable = 1
    
    %if jahre_check_non_numbers == 0
        %texte = "Fehler, als Eingabe werden nur Zahlen akzeptiert.";
        %disp(texte)

    %elseif jahre_check_non_numbers == 1
        jahre_isnumber = isnan(jahre); % Wenn Zahl, dann = false = 0
        jahre_empty = isempty(jahre);  % leere Eingabe = true = 1
        jahre_positive = isreal(sqrt(-jahre)); % Wenn positive Zahl, dann = false = 0

        if jahre_isnumber == 0
        istkorrekt1 = 1;
        text1 = "";

        elseif jahre_isnumber == 1                                                      
            text1 = "[Jahre] : Die Eingabe muss eine Zahl sein.";     
            disp(text1)

        elseif jahre >= 30 
            text1 = "[Jahre] : Der maximale Wert für die Jahre beträgt 29.";
   
        end

        if jahre_empty == 1
            text1 = "Sie haben nichts eingegeben, bitte versuchen Sie es erneut.";
            istkorrekt1 = false;
        end

         if jahre_positive == 1
            text1 = "[Jahre] : Negative Zahlen sind nicht zulässig.";
            istkorrekt1 = false;
        end
    %end 
     
end

function [istkorrekt2,text2] = pruefzins(zinssatz)
%Diese Funktion prüft...
    %text1 = "satz"
    
    %Validierung der Eingabe: Zinssatz
    
    zinssatz_isnumber = isnan(zinssatz); % Wenn Zahl, dann = false = 0
    zinssatz_empty = isempty(zinssatz);  % leere Eingabe = true = 1
    zinssatz_positive = isreal(sqrt(-zinssatz)); % Wenn positive Zahl, dann = false = 0

    if zinssatz_empty == 1
        text2 = "[Zinssatz]: Sie haben nichts eingegeben, bitte versuchen Sie es erneut.";
        istkorrekt2 = false;
    end

    if zinssatz_positive == 1
        text2 = "[Zinssatz] : Negative Zahlen sind nicht zulässig.";
        istkorrekt2 = false;
    end
    
    if zinssatz_isnumber == 0
        istkorrekt2 = true;
        text2 = "";

    elseif zinssatz_isnumber == 1                                                       
        text2 = "[Zinssatz] : Die Eingabe muss eine Zahl sein.";     
        disp(text2)
        
    elseif zinssatz < 0 
        text2 = "[Zinssatz] : Der minimale Wert für den Zinssatz beträgt 0 [%].";
        disp(text2)
        
    elseif zinssatz >= 120
        text2 = "[Zinssatz] : Der maximale Wert für den Zinssatz beträgt 120 [%].";
   
    end
    
    zinssatz = round(zinssatz,1);
    format short g
    zinssatz_real = isreal(zinssatz);

    if zinssatz >= 0 || zinssatz < 120 
        istkorrekt2 = true;
        text2 = "";

    elseif zinssatz < 0 
        text2 = "Der kleinstmögliche Zinnsatz ist 0 [%]. [eine Nachkommastelle möglich]";
        disp(text2)

    elseif zinssatz_real == 0
        text2 = "Fehler: Ihre Eingabe ist keine Zahl.";
        disp(text2)

    end

end

function [istkorrekt3,text3] = pruefanlage(anlage)
%Diese Funktion prüft...
    %text1 = "anl"

    %Validierung der Eingabe: Anlage
    
    anlage_isnumber = isnan(anlage);               % Wenn Zahl, dann = false = 0
    anlage_empty = isempty(anlage);                % leere Eingabe = true = 1

    if anlage_empty == 1
        text3 = "[Kapital]: Sie haben nichts eingegeben, bitte versuchen Sie es erneut.";
        disp(text3)
        istkorrekt3 = 0;
    end

    if anlage_isnumber == 0
        istkorrekt3 = true;
        text3 = "";
        disp(text3)

    elseif anlage_isnumber == 1                                                    
        text3 = "[Kapital] : Die Eingabe muss eine Zahl sein.";     
        disp(text3)
        istkorrekt3 = 0;

    end
    
    anlage = round(anlage,2);
    format short g
    anlage_real = isreal(anlage);

    if anlage_real == 1
        istkorrekt3 = true;
        text3 = "";

    elseif anlage_real == 0
        text3 = "Fehler: Ihre Eingabe ist keine Zahl.";
        disp(text3)

    else
        text3 = "Fehler: Die Eingabe ist keine Zahl.";
        disp(text3)

    end
end 