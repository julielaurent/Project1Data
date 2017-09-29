function [ u ] = KMeans( centersInit, K, N, sampleVec )
%UNTITLED2 Summary of this function goes here
%   u -> center of cluster
%   s -> vector of samples
%   n -> iteration on samples
%   N -> nombre total de samples
%   k -> iteration on clusters
%   K -> nombre tot de clusers
%   

u = centersInit; %vector with initialization of all centers
u0 = zeros(size(u));
r = zeros(N,K);
dist = zeros(N,K);
s = sampleVec;

while (abs(norm((u-u0))) < 10^-8)
    
    u0 = u;
    
    for n = 1:N

        for k = 1:K
        
            dist(n,k) = (norm(s(n) - u(k)))^2;
        
        end
    
        r(n,find(min(dist(n,:)))) = 1;
    
    end
    
    u = sum(r.*s) ./ sum(r);
    %u(k) = sum(r(n,k)*s(n))./sum(r(n,k));

end
    
end

