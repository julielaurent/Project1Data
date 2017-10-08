close all;
clear all;
clc;

load('spikes.mat');

%% JUST WITH 3 CLUSTERS
% With 3 clusters, here are the results
K = 3;
[idx,C] = kmeans(spikesPCA,K);
gplotmatrix(spikesPCA,[],idx);

%AP Representation
figure('Color','w');
for i = 1:3
    plot(mean(spikes(find(idx == i),:)));
    hold on;
end
set(gca,'XLim',[0 100],'XTick',linspace(0,100,9));
xticklabels({'0' '0.25' '0.5' '0.75' '1' '1.25' '1.5' '1.75' '2'});
xlabel('Time [ms]');
ylabel('Amplitude');
title('Mean of the spikes for each cluster')
box off;
hold off;

% Scatter Representation in 3D
figure('Color','w');
for i = 1:3
    scatter3(spikesPCA(find(idx == i),1),spikesPCA(find(idx == i),2),spikesPCA(find(idx == i),3),8,'.');
    hold on;
end
plot3(C(:,1),C(:,2),C(:,3),'xk','MarkerSize',8,'LineWidth',1.5);
xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
title('Principal components after k-means clustering')
hold off;


% Scatter Representation in 3D
figure('Color','w');
for i = 1:3
    scatter(spikesPCA(find(idx == i),1),spikesPCA(find(idx == i),2),8,'.');
    hold on;
end
plot3(C(:,1),C(:,2),C(:,3),'xk','MarkerSize',10,'LineWidth',3);
xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
title('PC1 vs PC2 after k-means clustering')
hold off;



%% REVOIR TOUTE CETTE PARTIE (50 fois avec diff?rentes conditions initiales) 
% % We try to execute 50 times the kmean clustering with random initial conditions
% % to see if it changes the result  
% % K = 3;
% % vec1 = zeros(50,100);
% % vec2 = zeros(50,100);
% % vec3 = zeros(50,100);
% % 
figure('Color','w')
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
title('50 times the k-means clustering with random initial conditions')
hold off;

figure('Color','w');
plot(mean(spikes(find(idx == 1),:)));
hold off;
% %figure(1);
% % for i = 1:50
% %     figure()
% %     plot(vec1(i,:));
% %     hold on;
% % end
% % hold off;
% 
% % figure(2);
% % for i = 1:50
% %     plot(vec2(i,:));
% %     hold on;
% % end
% % hold off;
% % 
% % figure(3);
% % for i = 1:50
% %     plot(vec3(i,:));
% %     hold on;
% % end
% % hold off;


 %% DIFFERENT NUMBER OF ITERATIONS FOR KMEAN
% Pas demand?, je voulais juste voir ce que ca changeait avec diff?rents nombres d'it?rations 
% 
% 
% figure('Color','w');
% K=3;
% it = 9;
% sTot = 1:it; %initialization of the sTot matrix 
% for i = 1:it
%     subplot(3,3,i) 
%     hold on
%     [idx,C] = kmeans(spikesPCA, K);
%     idx2Region = kmeans(spikesPCA,K, 'MaxIter',i ,'Start', C); 
%     % i maximum number of iterations allowed
%     % Choose initial cluster centroid positions as the last one computed
%     gscatter(spikesPCA(:,1),spikesPCA(:,2), idx2Region);
%     plot(C(1:K,1),C(1:K,2),'xk', 'MarkerSize',5,'LineWidth',3); % plot the center of the cluster
%     xlabel('PC1');
%     ylabel('PC2');
%     title([num2str(i+1) ' Iterations'])
%     hold off
% end


%% DIFFERENT NUMBER OF CLUSTERS

% We try with different numbers of clusters
for K = 1:50
    
    [idx,C,sumd] = kmeans(spikesPCA,K);
    %sumd is the sum ofpoint-to-centroid distances in each cluster
    %total sum of distances
    sTot(K) = sum(sumd);
    
%     figure('Color','w');
%     % AP representation
%     for i = 1:K
%         plot(mean(spikes(find(idx == i),:)));
%         hold on;
%     end
%     title([num2str(K) ' clusters']);
%     set(gca,'XLim',[0 100],'XTick',linspace(0,100,5));
%     xticklabels({'0'  '0.5' '1' '1.5' '2'});
%     xlabel('Time [ms]');
%     ylabel('Amplitude');
%     box off;
%     hold off;
%     
%     % Gplot representation
%     figure('Color','w');
%     gplotmatrix(spikesPCA,[],idx);
%     title([num2str(K) ' clusters']);  
  
end

% Plot within-cluster sum of squared error
figure('Color','w');
plot(sTot,'x');
axis([2 50 0 3000]);
xlabel('Number of Clusters'); ylabel('Within-cluster sum of squared errors');
title('Impact of the number of clusters on the Within-cluster sum of squared errors')

%% BEST NUMBER OF CLUSTERS
% On a pas du tout les m?mes r?sultats avec les diff?rents criterions, que
% faire ? Quel K choisir ?

%eva1 = evalclusters(spikesPCA,'kmeans','CalinskiHarabasz','KList',[1:6]) % Optimal K = 3
%eva2 = evalclusters(spikesPCA,'kmeans','DaviesBouldin','KList',[1:6]) % Optimal K = 2
%eva3 = evalclusters(spikesPCA,'kmeans','gap','KList',[1:6]) % Optimal K = 6
%eva4 = evalclusters(spikesPCA,'kmeans','silhouette','KList',[1:6]) % Optimal K = 2
