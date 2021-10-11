clc, clear, close all;

N = 40;

docuRatings = randi(5,N,1);

noice = 4:1:100;
noExp = 100;
crk = zeros(noExp, size(noice,2));
crp = zeros(noExp, size(noice,2));

for i=1:size(noice,2)
    for j =1:noExp
        eduLevel = ceil( (docuRatings + randi(noice(i), N ,1) )/(noice(i) + 5) * 4 );

        crk(j,i) = corr(docuRatings,eduLevel,'type','kendall');
        crp(j,i) = corr(docuRatings,eduLevel,'type','pearson');
    end
    i
end

%%
plot(abs(mean(crk, 1) - mean(crp, 1)), 'r');
xlabel('noice');
ylabel('correlation difference');
grid on;



