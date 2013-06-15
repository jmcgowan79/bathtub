data = dlmread('data_bathtub_simpleC50S.txt');
t = data(:,1);
c = data(:, end-3);
plot(t, c);
title('50 Sources');
xlabel('TIME');
ylabel('CELL KILLER CONCENTRATION');

