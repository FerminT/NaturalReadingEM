%% Correr esto para crear APAR (el archivo ya creado est� en
% reading/textos)

clear all
close all

% % de julia
addpath('C:\Documents and Settings\Julia\Dropbox\reading\analisis\my_functions\')
palpath='C:\Documents and Settings\Julia\Dropbox\reading\catgram\genero_excels\';
cd('C:\Documents and Settings\Julia\Dropbox\reading\textos\')


ind={'1' '2' '3' '4' '5' '6' '7' '8' '9' '10'};
APAR=struct([]);

for i=1:length(ind)
    APAR(i).VALEN=calcula_distribucion(palpath,ind{i});   %Encuentra las palabras que se repiten en el texto
end

save(['APAR_textos'],'APAR');


%% Histogramas

% percentilbaja=33;
% percentilalta=66;

for i=1:length(APAR)
%     BajaFrec    = prctile([APAR(i).VALEN.freqglobal],percentilbaja)
%     AltaFrec    = prctile([APAR(i).VALEN.freqglobal],percentilalta)
    BajaFrec=149;
    AltaFrec=660;
    figure(100 + i); hold all
        Hb=hist([APAR(i).VALEN([APAR(i).VALEN.freqglobal]<=(BajaFrec)).nAPAR],1:max([APAR(i).VALEN.nAPAR]));  
        Ha=hist([APAR(i).VALEN([APAR(i).VALEN.freqglobal]>(AltaFrec)).nAPAR],1:max([APAR(i).VALEN.nAPAR])); 
        Hb=(Hb(2:end))'; Ha=(Ha(2:end))'; Y=[Hb Ha];
%         Hb
%         Ha
        h=bar(Y,1,'grouped');
        set(h(1),'facecolor','blue','linewidth',1,'barwidth',1);
        set(h(2),'facecolor','red','linewidth',1,'barwidth',1);
        axis([1 45 0 100]);
        xlabel('# de Apariciones');
        legend({'Baja frec' 'Alta frec'});
end
hold off

%% Palabras de baja y alta (primero definir BajaFrec, AltaFrec e i)

palabras1={APAR(i).VALEN([APAR(i).VALEN.freqglobal]<=(BajaFrec) & [APAR(i).VALEN.nAPAR]==1).palabra};
palabras2={APAR(i).VALEN([APAR(i).VALEN.freqglobal]>=(AltaFrec) & [APAR(i).VALEN.nAPAR]==1).palabra};