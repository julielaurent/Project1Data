% All spikes
%figure(1)
%for i = 1:length(spikes)
 %   plot(spikes(i,:));
  %  hold on;
%end
%hold off;

% Three random spikes, each representative of the category
figure(2)
plot(spikes(1,:));
hold on;
plot(spikes(6000,:));
hold on;
plot(spikes(3000,:));
hold off;

%Feature Representation
%Feature 1 vs. Feature 2
figure(3)
scatter(spikesPCA(:,1),spikesPCA(:,2));
%Feature 2 vs. Feature 3
figure(4)
scatter(spikesPCA(:,2),spikesPCA(:,3));
%Feature 3 vs. Feature 1
figure(5)
scatter(spikesPCA(:,3),spikesPCA(:,1));
%All features together
figure(6)
scatter3(spikesPCA(:,1),spikesPCA(:,2),spikesPCA(:,3));

% Histogram of frequencies
figure(7);
histogram(spikesPCA,3);