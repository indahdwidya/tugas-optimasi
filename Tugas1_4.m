% bersihkan layar dan variabel
clc
clear
% input data
profit = [15 30 25 40 30 50]; 
weight = [5 10 8 15 8 10]; 
M = 20; 
% parameter
n = length(profit);
m = length(weight);
weigt0 = weight;
M0 = M;
n0 = n;
m0 = m;
profit0 = profit;
maksm = sum(weight);
% cek kapasitas dengan maksimum profit
% cek dimensionalitas
if n ~= m
    disp('Error, matrik profit dan weight tidak sama')
end
% ---------------------------------
% Greedy by Weight
% ---------------------------------       
W = sort(weight); 
for i = 1:n 
    for j = 1:m 
        a = W(i);
        b = weight(j); 
        if a == b 
            P(i) = profit(j); 
            urutan(i) = j; 
            weight(j) = -b; 
            break;
        end
    end
end
berat = 0;
i = 0;
while berat <= M
    i = i+1; 
    berat = berat + W(i); 
end
if berat > M
    berat = berat - W(i); 
    i = i - 1; 
end
% cetak hasil
untung = sum (P(1:i)); 
urutan = sort(urutan(1:i)); 
disp(' ')
disp('Greedy By Weight');
disp('----------------')
disp(['jenis barang yang di angkut: ', num2str(urutan(1:i))])
disp(['jumlah beban yang di angkut: ', num2str(berat)])
disp(['jumlah keuntungan: ', num2str(untung)]);
% ---------------------------------
% Greedy by Profit
% ---------------------------------
weight = weigt0;
M = M0;
n = n0;
m = m0;
profit = profit0;
P = sort(profit); % profit yang sudah urut dari kecil ke besar
P = P(n:-1:1);
% menyesuaikan urutan weihgt dan urutan barang
for i = 1:n
    for j = 1:m 
        a = P(i);
        b = profit(j);
        if a == b
            W(i) = weight(j);
            urutan(i) = j;
            profit(j) =- b;
            break;
        end
    end
end
berat = 0;
i = 0;
while berat <= M
    i = i + 1;
    berat = berat + W(i);
end
if berat > M
    berat = berat - W(i);
    i = i-1;
end
% cetak hasil
untung = sum(P(1:i));
urutan = sort(urutan(1:i));
disp(' ')
disp('Greedy By Profit');
disp('----------------')
disp(['jenis barang yang di angkut: ', num2str(urutan(1:i))])
disp(['jumlah beban yang di angkut: ', num2str(berat)])
disp(['jumlah keuntungan: ', num2str(untung)]);
% ---------------------------------
% Greedy by Density
% ---------------------------------
weight = weigt0;
M = M0;
n = n0;
m = m0;
profit = profit0;
rasio = profit ./ weight;
R = sort(rasio); % weight yang sudah urut dari kecil ke besar
R = R(n:-1:1);
% menyesuaikan urutan profit dan urutan barang
for i = 1:n
    for j = 1:m
        a = R(i);
        b = rasio(j);
        if a == b
            P(i) = profit(j);
            W(i) = weight(j);
            urutan(i) = j;
            rasio(j) = -b;
            break;
        end
    end
end
berat = 0;
i = 0;
while berat <= M
    i = i + 1;
    berat = berat + W(i);
end
if berat > M
    berat = berat - W(i);
    i = i - 1;
end
% cetak hasil
untung = sum (P(1:i));
urutan = sort(urutan(1:i));
disp(' ')
disp('Greedy By Density');
disp('-----------------')
disp(['jenis barang yang di angkut: ', num2str(urutan(1:i))])
disp(['jumlah beban yang di angkut: ', num2str(berat)])
disp(['jumlah keuntungan: ', num2str(untung)]);