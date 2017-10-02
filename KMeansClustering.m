close all;
clear all;
clc;

load('spikes.mat');
K = 3;
vec1 = zeros(50,100);
vec2 = zeros(50,100);
vec3 = zeros(50,100);

figure()
for j = 1:50
    idx = kmeans(spikesPCA,K);
    %figure(j);
    %gplotmatrix(spikesPCA,[],idx);
        %vec1(j,:)=mean(spikes(find(idx == 1),:));
        %vec2(j,:)=mean(spikes(find(idx == 2),:));
        %vec3(j,:)=mean(spikes(find(idx == 3),:));
    for i = 1:3
         plot(mean(spikes(find(idx == i),:)));
         hold on;
     end
end
hold off;
%figure(1);
% for i = 1:50
%     figure()
%     plot(vec1(i,:));
%     hold on;
% end
% hold off;

% figure(2);
% for i = 1:50
%     plot(vec2(i,:));
%     hold on;
% end
% hold off;
% 
% figure(3);
% for i = 1:50
%     plot(vec3(i,:));
%     hold on;
% end
% hold off;

for K = 2:6
    idx = kmeans(spikesPCA,K);
    figure();
    gplotmatrix(spikesPCA,[],idx);
    for i = 1:K
        plot(mean(spikes(find(idx == i),:)));
        hold on;
    end
end