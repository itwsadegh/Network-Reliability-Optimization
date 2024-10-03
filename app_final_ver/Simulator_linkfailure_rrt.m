function [reliability] = Simulator_linkfailure_rrt(AM,time,step,seed,lambda,mu)

rng(seed);

n = length(AM);
Adgacency = AM;
links = [];

for i = 1:n
    for j = i+1:n
        if AM(i,j) == 1
            links = [links; [i,j,1]];
        end
    end
end

m = length(links);
%m = 1;
times = 1:time/step:time;
real_step = numel(times);
p = time/real_step*lambda;
rep = time/real_step*mu;
reliability = 0;
counter = 0;
flag = 0;

for t = times
    for i = 1:m
        if links(i,3)==1 && rand()<p
            links(i,3) = 0;
            Adgacency(links(i,1),links(i,2)) = 0;
            Adgacency(links(i,2),links(i,1)) = 0;
            if counter<4
                counter = counter + 1;
            elseif counter == 4 && t<time/2
                flag = t;
                reliability = 0;
                counter = 5;
            else
                counter = 5;
            end
        elseif links(i,3)==0 && rand()<rep
            links(i,3) = 1;
            Adgacency(links(i,1),links(i,2)) = 1;
            Adgacency(links(i,2),links(i,1)) = 1;
        end
    end
    v = zeros(n-1);
    Ad = Adgacency;
    for i =1:n
        v = v + Ad(1,2:end);
        Ad = Ad*Adgacency;
    end
    rel = 1;
    for i = 1:n-1
        if v(i) == 0
            rel = 0;
        end
    end
    reliability = reliability + rel;
end

reliability = reliability/(real_step-flag*real_step/time);

end