function plot_tfexp_prefspeed(tfexp)

%
%
%
%
%


epochs = {'TF1','TF2','TF3','TF4'};



% Site all, average, and ste.

speed_site_all = [tfexp.TF1.speed.speed_pref_all, ...
    tfexp.TF2.speed.speed_pref_all, ...
    tfexp.TF3.speed.speed_pref_all, ...
    tfexp.TF4.speed.speed_pref_all];
speed_site_avg = [tfexp.TF1.speed.speed_pref_avg, ...
    tfexp.TF2.speed.speed_pref_avg, ...
    tfexp.TF3.speed.speed_pref_avg, ...
    tfexp.TF4.speed.speed_pref_avg];
speed_site_ste = [tfexp.TF1.speed.speed_pref_ste, ...
    tfexp.TF2.speed.speed_pref_ste, ...
    tfexp.TF3.speed.speed_pref_ste, ...
    tfexp.TF4.speed.speed_pref_ste];


figure();
hold on;

bar(speed_site_avg,0.5,'c');
errorbar(speed_site_avg,speed_site_ste,'k.','LineWidth',3);

box off;
axis([0.5 4.5 0 max(speed_site_all)]);
set(gca,'FontSize',14,'LineWidth',3);
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',{'0 Hours', '3 Hours', '6 Hours', '9 Hours'});
title('Single Preferred Speed');


for i = 1:4, % For each epoch add individual sites
    
    jitter = rand(length(tfexp.(epochs{i}).speed.speed_pref_all),1) .* 0.2; % Jitter x values a little bit
    x = jitter + i - mean(jitter);
    plot(x,tfexp.(epochs{i}).speed.speed_pref_all,'k.','markersize',10);
    
end;




