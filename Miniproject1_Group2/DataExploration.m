close all;
clear all;
clc;

load('spikes.mat');

% Plot all spikes on same plot
figure('Color','w');
for i=1:6000
    plot(spikes(i,:));
    hold on;
end
%verify axis labels
set(gca,'XLim',[0 100],'XTick',linspace(0,100,9));
xticklabels({'0' '0.25' '0.5' '0.75' '1' '1.25' '1.5' '1.75' '2'});
xlabel('Features as Time');
ylabel('Amplitude');
box off;
title('Spikes')
hold off;

% Plot histograms and boxplots for each principal component
figure('Color','w');

subplot(3,1,1);
scatter(spikesPCA(:,1), spikesPCA(:,2), 5, '.');
xlabel('PC1'); ylabel('PC2');
set(gca,'XTick',-2.5:2.5);
set(gca,'YTick',-2:2:2);
box off;

subplot(3,1,2);
scatter(spikesPCA(:,1), spikesPCA(:,3), 5, '.');
xlabel('PC1'); ylabel('PC3');
set(gca,'XTick',-2.5:2.5);
set(gca,'YTick',-2:2:2);
box off;

subplot(3,1,3);
scatter(spikesPCA(:,2), spikesPCA(:,3), 5, '.');
xlabel('PC2'); ylabel('PC3');
set(gca,'XTick',-2.5:2.5);
set(gca,'YTick',-2:2:2);
box off;

figure('Color','w');
scatter(spikesPCA(:,1), spikesPCA(:,2), 5, '.');
xlabel('PC1'); ylabel('PC2');
set(gca,'XTick',-2.5:2.5);
set(gca,'YTick',-2:2:2);
title('PC1 vs PC2')
box off;

% Plot a 3D scatter of all plincipal components
figure('Color','w');
scatter3(spikesPCA(:,1),spikesPCA(:,2), spikesPCA(:,3), 10, '.');
xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
box off;

% Compare distributions of each principal component with histograms and
% boxplots
figure('Color','w');

subplot(3,3,[1,4]);
histogram(spikesPCA(:,1));
axis([-3 3 0 700]);
set(gca,'YTick',0:200:700);
title('PC1');
box off;

subplot(3,3,[2,5]);
histogram(spikesPCA(:,2));
axis([-1.5 1.5 0 700]);
set(gca,'YTick',0:200:700);
title('PC2');
box off;

subplot(3,3,[3,6]);
histogram(spikesPCA(:,3));
axis([-1.5 1.5 0 700]);
set(gca,'YTick',0:200:700);
title('PC3');
box off;

subplot(3,3,7);
boxplot(spikesPCA(:,1),'orientation','horizontal','OutlierSize',2);
axis([-3 3 0.75 1.25]);
yticklabels({''});
box off;

subplot(3,3,8);
boxplot(spikesPCA(:,2),'orientation','horizontal','OutlierSize',2);
axis([-1.5 1.5 0.75 1.25]);
yticklabels({''});
box off;

subplot(3,3,9);
boxplot(spikesPCA(:,3),'orientation','horizontal','OutlierSize',2);
axis([-1.5 1.5 0.75 1.25]);
yticklabels({''});
box off;

% Everything together
figure('Color','w')
plotmatrix(spikesPCA,'.');
box off;