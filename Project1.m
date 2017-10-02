close all;
clear all;
clc;

load('spikes.mat');
% 
% figure(1)
% for i=1:6000
%     plot(spikes(i,:))
%     hold on
% end
% 
% figure(2)
% subplot(3,1,1)
% scatter(spikesPCA(:,1), spikesPCA(:,2))
% legend ('PC1 vs PC2')
% subplot(3,1,2)
% scatter(spikesPCA(:,1), spikesPCA(:,3))
% legend ('PC1 vs PC3')
% subplot(3,1,3)
% scatter(spikesPCA(:,2), spikesPCA(:,3))
% legend ('PC2 vs PC3')
% 
% figure(3)
% scatter3(spikesPCA(:,1),spikesPCA(:,2), spikesPCA(:,3))
% legend ('PC1 vs PC2 vs PC3')
% 
% figure(4) % mettre axis...
% subplot(2,3,1)
% histogram(spikesPCA(:,1))
% xlabel('PC1')
% subplot(2,3,2)
% histogram(spikesPCA(:,2))
% xlabel('PC2')
% subplot(2,3,3)
% histogram(spikesPCA(:,3))
% xlabel('PC3')
% subplot(2,3,4)
% boxplot(spikesPCA(:,1),'orientation','horizontal')
% xlabel('PC1')
% subplot(2,3,5)
% boxplot(spikesPCA(:,2),'orientation','horizontal')
% xlabel('PC2')
% subplot(2,3,6)
% boxplot(spikesPCA(:,3),'orientation','horizontal')
% xlabel('PC3')
% 
% figure(5)
% plotmatrix(spikesPCA)

figure(6)
idx=kmeans(spikesPCA,3);
gplotmatrix(spikesPCA,[],idx);

for K=1:5 
    idx=kmeans(spikesPCA,K);
    figure(6+K)
    for i=1:K
        plot(mean(spikes(find(idx==i),:)))
        hold on
    end
    hold off
end

