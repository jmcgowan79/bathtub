data = dlmread('data_bathtub_simpleC100S.txt');
t = data(:,1);
c = data(:, end-3);
plot(t, c);
title('100 Sources');
xlabel('TIME');
ylabel('CELL KILLER CONCENTRATION');

