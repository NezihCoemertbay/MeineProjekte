

function laufschriftgruppe01(~)
clear
clc

text1 = input("Bitte eine Zahl eingeben: " , "s");

% Validierung der Eingabe / der Zahl
%======================================================

%Vermeiden von Symbolen / Buchstaben + Allgemeine Nutzungshinweise
%=================================================================
text1_nan = isnan(str2double(text1));

if text1_nan == 1
    disp(" ")
    disp("Die Eingabe ist keine Zahl, beachten Sie folgende Hinweise:")
    disp("1.) Die Eingabe muss eine natürliche Zahl sein, die Verwendung von Minus, Leertaste, Symbolen und Zeichen ist ungültig.")
    disp("2.) Die Ziffern der Zahl dürfen nicht kleiner 0 oder größer 7 sein.")
    disp("3.) Die Zahl darf aus mindestens 8 und maximal 20 Ziffern bestehen.")
    return
end

%Dezimalzahlen vermeiden
%=======================
zahl_decimaltest = str2double(text1);
zahl_round = round(zahl_decimaltest);

if zahl_round ~= zahl_decimaltest
    disp(" ")
    disp("Die Eingabe darf keine Dezimalzahl sein.")
    return
end

%Dezimalzahlen (Eingabe mit ",") vermeiden
%=========================================
pat_komma = ",";
text1_komma = count(text1,pat_komma);

if text1_komma == 1
    disp(" ")
    disp("Die Eingabe darf keine Dezimalzahl sein.")
    return

elseif text1_komma > 1
    disp(" ")
    disp("Sie versuchen mehrere Kommas in der Eingabe zu verwenden, bitte beachten Sie folgende Hinweise:")
    disp("1.) Die Auflistung von Zahlen ist nicht möglich")
    disp("2.) Die Eingabe mehrerer Kommas führt zu einem Fehler.")
    return
end


%Länge der Zahl / Anzahl Ziffern validieren
%==========================================
text1_length = length(text1);

if text1_length < 8
    disp(" ")
    disp("Die Zahl muss aus mindestens 8 Ziffern bestehen.")
    return

elseif text1_length > 20 
    disp(" ")
    disp("Die Zahl darf maximal aus 20 Ziffern bestehen.")
    return
end

%Ziffern der Zahl dürfen nicht größer 8 / ( kleiner 0 => nicht möglich)
%======================================================================
pat_8 = "8";
pat_9 = "9";

text1_8 = contains(text1, pat_8);
text1_9 = contains(text1, pat_9);

if text1_8 == true || text1_9 == true
    disp(" ")
    disp("Die Zahl enthält eine '8' oder '9', beachten Sie, dass nur Ziffern von '0' bis '7' gültig sind.")
    return
end

%Vermeiden, dass erste Zahl eine '0' ist
%=====================================
null = '0';
if text1(1) == null
    disp("Die Zahl darf nicht mit einer 0 beginnen.")
    return
end

%Umwandlung: Eingabe => Zahl => Ziffern => Binärzahlen => 2D-Matrix / Pixelmatrix
%================================================================================

%Umwandlung: Eingabe => Zahl
%===========================
zahl = str2double(text1);

%Umwandlung: Zahl => Ziffern
%====================================

%Umwandlung: Zahl(num) => Zahl(String)
%=====================================
ziffern_str = split(num2str(zahl));

%Umwandlung: Zahl(String) => einzelne Ziffern(Cell-Array)
%========================================================
ziffern_cell = split(ziffern_str, '');

%Umwandlung: einzelne Ziffern(Cell-Array) => Ziffern(Cell-Array) [numerisch]
%===========================================================================

%for-Schleife wandelt jede einzelne Spalte in einen numerischen Wert um:
%Beispiel: {'4'     } => {[     4]}

for i=1:(text1_length + 2) 
    %Warum '+ 2' ? => Da bei der Auflistung von ziffern_cell die erste und letzte Spalte {0×0 char} 
    %ist und somit die letzten Werte nicht umgewandelt werden 
    %(wir müssen {0×0 char}  aussortieren...)

    ziffern_cell{i} = str2double(ziffern_cell{i});
end   

% {0×0 char} am Anfang und am Ende des Cell-Arrays löschen
% (erste und letzte Zeile)
ziffern_cell{1} = []; %Erste Zeile 

empty_cell2 = text1_length + 2;
ziffern_cell{empty_cell2} = []; %Zweite Zeile

%Entfernen von{0×0 double} in der ersten und letzten Spalte
for i=2:text1_length % {0×0 double} am Ende entfernen
    ziffern_cell{i} = ziffern_cell{i};
end

%Umwandlung: Ziffern(Cell-Array) [numerisch] => Ziffern(Cell-Array) [numerisch] [binär]
%======================================================================================

%Ziffern in Binärzahlen umwandeln 
ziffernbin_cell = cellfun(@dec2bin, ziffern_cell, 'UniformOutput', false);

%Wir haben es nicht geschafft, Matlab zu sagen, dass es nur mit den
%vollständigen Zahlen rechnen soll, aus Zahlen mit mehr als 16 Ziffern
%macht Matlab eine Zahl in der Form 1.xxxxxxe+16 wobei 'e' und das '+'
%nicht in eine Binärzahl umgewandelt werden können und somit eine
%Fehlermeldung erscheint und außerdem der Exponent ab 18 Ziffern ^18 ist und somit die Ziffer >7 wäre...

%{0×0 char} am Anfang und am Ende des Cell-Arrays entfernen
ziffernbin_cell(1) = [];
ziffernbin_cell(text1_length +1) = [];

%Umwandlung: Ziffern(Cell-Array) [numerisch] [binär] => 2D - Matrix mit Ziffern [binär]
%======================================================================================

%Cell-Array-Werte in numerische Werte umwandeln
ziffernbin_cell = str2double(ziffernbin_cell);

%Pixelmatrix mit 3 Spalten und n(=Ziffernanzahl) Spalten erstellen
pixelmatrix = zeros(3,text1_length);

%Ziffernbin_cell transponieren, sodass Binärzahlen horizontal angezeigt werden
ziffernbin_cell = transpose(ziffernbin_cell);
disp(ziffernbin_cell)

%Werte von 'ziffernbin_cell' in 'pixelmatrix' einfügen mit einer for-Schleife für i (Spalten) und j (Zeilen)
[numRows, numCols] = size(pixelmatrix);
%numRows = Anzahl der Zeilen (immer m = 3)
%numCols = Anzahl der Spalten (n)

%Die Binärzahlen von ziffernbin_cell in die Pixelmatrix einfügen
for i=1:numRows
    for j=1:numCols
        pixelmatrix(i,j) = ziffernbin_cell(j);
    end
end

%Für die jeweiligen Binärzahlen die Matrix-Spalten festlegen
for i=1:numCols
    if ziffernbin_cell(1,i) == 1 %Matrix verändern für Binärzahl: 1 (1)
        pixelmatrix(1,i) = 0;
        pixelmatrix(2,i) = 0;

    elseif ziffernbin_cell(1,i) == 10 %Matrix verändern für Binärzahl: 10 (2)
        pixelmatrix(1,i) = 0;
        pixelmatrix(2,i) = 1;
        pixelmatrix(3,i) = 0;
    
    elseif ziffernbin_cell(1,i) == 11 %Matrix verändern für Binärzahl: 11 (3)
        pixelmatrix(1,i) = 0;
        pixelmatrix(2,i) = 1;
        pixelmatrix(3,i) = 1;     

    elseif ziffernbin_cell(1,i) == 100 %Matrix verändern für Binärzahl: 100 (4)
        pixelmatrix(1,i) = 1;
        pixelmatrix(2,i) = 0;
        pixelmatrix(3,i) = 0;
    
    elseif ziffernbin_cell(1,i) == 101 %Matrix verändern für Binärzahl: 101 (5)
        pixelmatrix(1,i) = 1;
        pixelmatrix(2,i) = 0;
        pixelmatrix(3,i) = 1;
    
    elseif ziffernbin_cell(1,i) == 110 %Matrix verändern für Binärzahl: 110 (6)
        pixelmatrix(1,i) = 1;
        pixelmatrix(2,i) = 1;
        pixelmatrix(3,i) = 0;

    elseif ziffernbin_cell(1,i) == 111 %Matrix verändern für Binärzahl: 111 (7)
        pixelmatrix(1,i) = 1;
        pixelmatrix(2,i) = 1;
        pixelmatrix(3,i) = 1;
    end
end
disp(pixelmatrix)

%Verwendung des Pixelzeichners zur Darstellung der pixelmatrix in Laufschrift
%============================================================================

    function pixelzeichner(pixelmatrix)
    %zeichnet den Matrixinhalt einer boolschen Matrix

    %if isempty(grafikobj) %beim Erstaufruf
    %    grafikobj= scatter(0,0);
    %end
    logpx = logical(pixelmatrix); %umwandeln in bools
    
    %Größe bestimmen
    ylen = length(logpx(:,1));
    xlen = length(logpx(1,:));
    
    %letzte Zeichnung löschen
    hold off %oder gibts ne andere Möglichkeit?
   
    for x = 1:xlen
        for y = 1:ylen
            if logpx(y,x) == true %dann einen Punkt zeichnen
                scatter(x,(1+ylen-y), Marker='o', MarkerEdgeColor=[0 1 0], MarkerFaceColor=[1 1 1], LineWidth=10);
                hold on
            end
        end
    end

    axis([0 xlen+1 0 ylen+1]);                     
    set(gca,'Color',[0 0 0])                      
    set(gca,'XColor', 'none', 'YColor', 'none')     
    
    end

    for i=1:length(text1)                   
       pixelzeichner(pixelmatrix)            
       pixelmatrix = circshift (pixelmatrix,[0 -1]); 
       i;                                   
       pause(1)                             
    end
    pixelzeichner(pixelmatrix)
end          